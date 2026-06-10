local gh = require('util').gh

local js_filetypes = {
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
}

vim.pack.add { gh 'stevearc/conform.nvim' }
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    local ft = vim.bo[bufnr].filetype
    if vim.tbl_contains(js_filetypes, ft) then
      -- eslint has no conform formatter, so use the LSP directly to apply
      -- fixes (import sorting etc.) before prettier runs.
      vim.lsp.buf.format {
        filter = function(client) return client.name == 'eslint' end,
        timeout_ms = 2000,
        bufnr = bufnr,
      }
      return { timeout_ms = 2000 }
    end
    return { timeout_ms = 2000 }
  end,
  formatters_by_ft = {
    -- conform searches node_modules/.bin before any global install,
    -- so these use the project's own tool versions automatically.
    javascript      = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescript      = { 'prettier' },
    typescriptreact = { 'prettier' },
    json            = { 'prettier' },
    css             = { 'prettier' },
    lua             = { 'stylua' },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })
