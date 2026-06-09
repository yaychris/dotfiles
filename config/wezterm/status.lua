local wezterm = require 'wezterm'
local act = wezterm.action

local SOLID_LEFT_ARROW  = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

local function extend(t, elements)
  for _, el in ipairs(elements) do
    table.insert(t, el)
  end
  return t
end

local function get_palette(color_scheme)
  local theme = wezterm.color.get_builtin_schemes()[color_scheme]

  return {
    bg = theme.background,
    segment = theme.selection_bg,
    yellow = theme.brights[4],
    cyan = theme.brights[7],
    text = theme.foreground,
    dark = theme.background,
  }
end

local function init_status_format(color_scheme)
  local palette = get_palette(color_scheme)

  wezterm.on('update-status', function(window, _)
    local workspace = window:active_workspace()
    local has_focus = window:is_focused()

    local unfocused_colors = {
      fg = palette.segment,
      bg = palette.dark,
    }

    -- Left status
    local workspace_colors = {
      fg = palette.dark,
      bg = palette.cyan,
    }

    if not has_focus then
      workspace_colors = unfocused_colors
    end

    window:set_left_status(wezterm.format({
      { Attribute = { Intensity = 'Bold', } },
      { Foreground = { Color = workspace_colors.fg } },
      { Background = { Color = workspace_colors.bg } },
      { Text = ' ' .. workspace .. ' ' },

      { Attribute = { Intensity = 'Normal' } },
      { Foreground = { Color = workspace_colors.bg } },
      { Background = { Color = palette.segment } },
      { Text = SOLID_RIGHT_ARROW },
    }))

    -- Right status
    local right_status = {}
    local date = wezterm.strftime '%b %d'
    local time = wezterm.strftime '%H:%M'

    local is_copy_mode = window:active_key_table() == 'copy_mode'

    local mode_colors = {
      fg = palette.dark,
      bg = palette.yellow,
    }

    if not has_focus then
      mode_colors = unfocused_colors
    end

    extend(right_status, {
      { Foreground = { Color = palette.segment } },
      { Background = { Color = palette.bg } },
      { Text = SOLID_LEFT_ARROW },

      { Foreground = { Color = palette.text } },
      { Background = { Color = palette.segment } },
      { Text = ' ' .. date .. '  ' .. time .. ' ' },
    })

    if is_copy_mode then
      extend(right_status, {
        { Foreground = { Color = mode_colors.fg } },
        { Background = { Color = mode_colors.bg } },
        { Attribute = { Intensity = 'Bold' } },
        { Text = ' COPY ' },
      })
    end

    window:set_right_status(wezterm.format(right_status))
  end)
end

local function init_tab_format(color_scheme)
  local palette = get_palette(color_scheme)

  wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local title = tab.tab_title
    if not title or #title == 0 then
      title = tab.active_pane.title
    end

    local index = tab.tab_index + 1
    local tab_text = tostring(index) .. ' ' .. title

    if #tab_text > 19 then
      tab_text = tab_text:sub(1, 18) .. '…'
    end

    local padded_title = ' ' .. tab_text .. ' '

    if tab.is_active then
      return wezterm.format({
        { Foreground = { Color = palette.text } },
        { Background = { Color = palette.segment } },
        { Text = padded_title },

        { Foreground = { Color = palette.segment } },
        { Background = { Color = palette.bg } },
        { Text = SOLID_RIGHT_ARROW },
      })
    else
      return wezterm.format({
        { Foreground = { Color = palette.text } },
        { Background = { Color = palette.bg } },
        { Text = padded_title },

        { Foreground = { Color = palette.bg } },
        { Background = { Color = palette.segment } },
        { Text = SOLID_RIGHT_ARROW },
      })
    end
  end)
end

return function (color_scheme)
  init_status_format(color_scheme)
  init_tab_format(color_scheme)
end
