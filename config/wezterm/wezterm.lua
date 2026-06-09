local wezterm = require 'wezterm'
local init_status_line = require 'status'
local workspaces = require 'workspaces'

local act = wezterm.action
local color_scheme = 'Tomorrow Night Eighties'

init_status_line(color_scheme)

return {
  -- Fish shell
  default_prog = { '/opt/homebrew/bin/fish' },

  -- Tab settings
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  tab_max_width = 24,
  show_tab_index_in_tab_bar = true,
  show_new_tab_button_in_tab_bar = false,

  -- Update clock time faster
  status_update_interval = 1000,

  -- Appearance
  color_scheme = color_scheme,
  colors = {
    background = '#262626',
  },

  font = wezterm.font({ family = 'Monaco Nerd Font' }),
  font_size = 13,

  native_macos_fullscreen_mode = true,

  -- Disable ligatures
  harfbuzz_features = { 'calt = 0', 'clig = 0', 'liga = 0' },

  -- Disable macOS chrome
  window_decorations = 'RESIZE',

  leader = {
    key = 'k',
    mods = 'CTRL',
    timeout_milliseconds = 1000,
  },

  keys = {
    -- Pane creation
    { key = '|', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },

    -- Pane movement
    { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },

    -- Pane resizing
    { key = 'H', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize { 'Left', 10 } },
    { key = 'J', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize { 'Down', 10 } },
    { key = 'K', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize { 'Up', 10 } },
    { key = 'L', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize { 'Right', 10 } },
    { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },

    -- Tab movement
    { key = 'h', mods = 'LEADER|CTRL', action = act.ActivateTabRelative(-1) },
    { key = 'l', mods = 'LEADER|CTRL', action = act.ActivateTabRelative(1) },

    -- Rename tab
    { key = ',', mods = 'LEADER', action = act.PromptInputLine {
      description = 'Enter new tab name',
      action = wezterm.action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }},

    -- Full screen
    { key = 'f', mods = 'LEADER', action = act.ToggleFullScreen },

    -- Copy Mode
    { key = 'Escape', mods = 'LEADER', action = act.ActivateCopyMode },

    -- Scroll to prompt
    { key = 'u', mods = 'LEADER', action = act.ScrollToPrompt(-1) },
    { key = 'd', mods = 'LEADER', action = act.ScrollToPrompt(1) },

    -- Workspace management
    { key = 's', mods = 'LEADER', action = workspaces.selector_action() },
    { key = 'S', mods = 'LEADER', action = act.SwitchToWorkspace },
    { key = '$', mods = 'LEADER', action = act.PromptInputLine {
      description = 'Rename workspace:',
      action = wezterm.action_callback(function(window, pane, line)
        if line and #line > 0 then
          wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
        end
      end),
    }},

    -- Custom workspace management via workspace files
    { key = 'W', mods = 'LEADER', action = workspaces.create_action() },
  },
}
