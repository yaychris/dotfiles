local gh = require('util').gh

vim.pack.add { gh 'RRethy/base16-nvim' }

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    -- Backgrounds
    vim.api.nvim_set_hl(0, 'Normal',          { bg = '#262626' })
    vim.api.nvim_set_hl(0, 'NormalNC',        { bg = '#262626' })
    vim.api.nvim_set_hl(0, 'NormalFloat',     { bg = '#1a1a1a' })
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#1a1a1a' })

    -- Statusline mode highlights
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal',  { bg = '#6699cc', fg = '#1d1d1d', bold = true })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeInsert',  { bg = '#99cc99', fg = '#1d1d1d', bold = true })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeVisual',  { bg = '#f99157', fg = '#1d1d1d', bold = true })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeReplace', { bg = '#f2777a', fg = '#1d1d1d', bold = true })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeCommand', { bg = '#ffcc66', fg = '#1d1d1d', bold = true })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeOther',   { bg = '#515151', fg = '#cccccc', bold = true })

    -- Statusline section highlights
    vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfo',  { bg = '#393939', fg = '#cccccc' })
    vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { bg = '#262626', fg = '#cccccc' })
    vim.api.nvim_set_hl(0, 'MiniStatuslineFileinfo', { bg = '#393939', fg = '#cccccc' })
    vim.api.nvim_set_hl(0, 'MiniStatuslineInactive', { bg = '#262626', fg = '#515151' })
  end,
})

vim.cmd.colorscheme 'base16-tomorrow-night-eighties'
