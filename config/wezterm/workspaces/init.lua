-- workspaces/init.lua
local wezterm = require 'wezterm'
local act = wezterm.action

local M = {}

local config_dir = wezterm.config_dir

-- ── Discover workspace spec files ─────────────────────────
local function discover_workspaces()
  local files = wezterm.glob(config_dir .. '/workspaces/*.lua')
  local names = {}
  for _, path in ipairs(files) do
    local name = path:match('workspaces/(.-)%.lua$')
    if name and not name:match('^_') and name ~= 'init' then
      table.insert(names, name)
    end
  end
  table.sort(names)
  return names
end

-- ── Build InputSelector choices ───────────────────────────
local function build_choices()
  local seen = {}
  local choices = {}

  -- Build a set of currently active workspace names
  local active_set = {}
  local active = wezterm.mux.get_workspace_names()
  for _, name in ipairs(active) do
    active_set[name] = true
  end

  -- Add workspaces discovered from spec files
  local files = discover_workspaces()
  for _, name in ipairs(files) do
    if not seen[name] then
      local label
      if active_set[name] then
        label = wezterm.format {
          { Foreground = { Color = '#87d7ff' } },
          { Attribute = { Intensity = 'Bold' } },
          { Text = '* ' .. name },
        }
      else
        label = wezterm.format {
          { Text = '  ' .. name },
        }
      end
      table.insert(choices, { id = name, label = label })
      seen[name] = true
    end
  end

  -- Add currently active workspaces not found in spec files
  for _, name in ipairs(active) do
    if not seen[name] then
      local label = wezterm.format {
        { Foreground = { Color = '#87d7ff' } },
        { Attribute = { Intensity = 'Bold' } },
        { Text = '* ' .. name },
      }
      table.insert(choices, { id = name, label = label })
      seen[name] = true
    end
  end

  -- Sort alphabetically by id for consistent display
  table.sort(choices, function(a, b) return a.id < b.id end)

  return choices
end

-- ── Create splits for a pane ──────────────────────────────
local function create_splits(pane, splits)
  if not splits then return end
  for _, split in ipairs(splits) do
    local child = pane:split {
      direction = split.direction,
      size = split.size,
    }
    if split.command then
      child:send_text(split.command)
    end
  end
end

-- ── Create a workspace from its spec ───────────────────────
local function create_workspace(name)
  local spec = require('workspaces.' .. name)
  local cwd = spec.cwd

  if not spec.tabs then
    wezterm.mux.spawn_window {
      workspace = name,
      cwd = cwd,
    }
    return
  end

  local window

  for i, tab_spec in ipairs(spec.tabs) do
    local tab, pane
    if i == 1 then
      tab, pane, window = wezterm.mux.spawn_window {
        workspace = name,
        cwd = cwd,
      }
    else
      tab, pane, window = window:spawn_tab { cwd = cwd }
    end

    if tab_spec.name then
      tab:set_title(tab_spec.name)
    end

    create_splits(pane, tab_spec.splits)
  end
end

-- ── Switch to a workspace (create if needed) ──────────────
function M.switch_to(name)
  local active = wezterm.mux.get_workspace_names()
  for _, ws in ipairs(active) do
    if ws == name then
      wezterm.mux.set_active_workspace(name)
      return
    end
  end

  -- Workspace doesn't exist — try to create from spec
  create_workspace(name)
  wezterm.mux.set_active_workspace(name)
end

-- ── The InputSelector action ──────────────────────────────
function M.selector_action()
  return wezterm.action_callback(function(window, pane)
    window:perform_action(act.InputSelector {
      title = 'Switch to workspace',
      fuzzy = true,
      choices = build_choices(),
      action = wezterm.action_callback(function(inner_window, inner_pane, id, label)
        if id then
          M.switch_to(id)
        end
      end),
    }, pane)
  end)
end

-- ── Create a new workspace spec file ──────────────────────
function M.create_action()
  return wezterm.action_callback(function(window, pane)
    window:perform_action(act.PromptInputLine {
      description = 'New workspace name:',
      action = wezterm.action_callback(function(inner_window, inner_pane, name)
        if not name or #name == 0 then return end

        inner_window:perform_action(act.PromptInputLine {
          description = 'Workspace directory (cwd):',
          action = wezterm.action_callback(function(inner2_window, inner2_pane, cwd)
            if not cwd or #cwd == 0 then return end

            -- Read the template
            local template_path = config_dir .. '/workspaces/_template.lua'
            local f = io.open(template_path, 'r')
            if not f then
              wezterm.log_error('Workspace template not found: ' .. template_path)
              return
            end
            local content = f:read('*a')
            f:close()

            -- Replace placeholder with the cwd value
            content = content:gsub('{{CWD}}', cwd)

            -- Write the new spec file
            local path = config_dir .. '/workspaces/' .. name .. '.lua'
            f = io.open(path, 'w')
            if f then
              f:write(content)
              f:close()
            end

            M.switch_to(name)
          end),
        }, inner_pane)
      end),
    }, pane)
  end)
end

return M
