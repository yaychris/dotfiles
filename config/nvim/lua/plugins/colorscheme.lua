local gh = require('util').gh

vim.pack.add { gh 'RRethy/base16-nvim' }

-- Customize backgrounds to be slightly darker
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.api.nvim_set_hl(0, 'Normal', { bg = '#262626' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = '#262626' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1a1a1a' })
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#1a1a1a' })
  end,
})

vim.cmd.colorscheme 'base16-tomorrow-night-eighties'
