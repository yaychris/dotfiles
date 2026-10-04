return {
  -- 'deparr/tairiki.nvim',
  -- 'seanmorton/vim-tomorrow-night-eighties',
  'chriskempson/vim-tomorrow-theme',
  lazy = false,
  priority = 1000,
  config = function()
    -- require("tairiki").setup({
    --   palette = "dimmed",
    -- })

    vim.cmd([[colorscheme Tomorrow-Night-Eighties]])
  end,
}
