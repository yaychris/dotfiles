-- Register .gd extension as gdscript filetype
vim.filetype.add {
  extension = { gd = 'gdscript' },
}

-- Override guess-indent: force spaces at width 2 (Godot defaults to tabs, but we prefer spaces)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gdscript',
  callback = function()
    vim.bo.expandtab = true
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
  end,
})

-- GDScript LSP via Godot's built-in language server.
-- Godot must be running for LSP features to work.
-- Port can be confirmed in: Editor → Editor Settings → Network → Language Server → Remote Port
--
-- Uses vim.lsp.start in a FileType autocmd rather than vim.lsp.config, because
-- vim.lsp.config doesn't support TCP connections (vim.lsp.rpc.connect).
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gdscript',
  callback = function()
    vim.lsp.start {
      name = 'gdscript',
      cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
      root_dir = vim.fs.root(0, { 'project.godot' }),
    }
  end,
})
