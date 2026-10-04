-- Odin Language Server — install via: brew install ols
-- lspconfig provides the default cmd/filetypes/root_dir for ols.
-- root_dir uses ols.json, .git, or any *.odin file to find the project root.
vim.lsp.enable 'ols'

-- Treesitter's indent query doesn't handle incomplete trees well (typing a new
-- line inside an open block). This wrapper uses treesitter when it can (great
-- for `=` re-indent) and falls back to a prev-line heuristic for Enter.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'odin',
  callback = function()
    vim.bo.indentexpr = "v:lua.require('util').brace_indent()"
  end,
})
