vim.lsp.config('glsl_analyzer', {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})
vim.lsp.enable 'glsl_analyzer'

local gh = require('util').gh
vim.pack.add { gh 'mfussenegger/nvim-lint' }

local lint = require 'lint'

lint.linters.glslangValidator = {
  cmd = 'glslangValidator',
  stdin = false,
  args = {},
  stream = 'stdout',
  ignore_exitcode = true,
  parser = function(output, bufnr)
    local diagnostics = {}
    -- output lines look like: ERROR: 0:12: 'foo' : undeclared identifier
    for _, line in ipairs(vim.split(output, '\n')) do
      local lnum, msg = line:match '^ERROR: %d+:(%d+): (.+)$'
      if lnum then
        table.insert(diagnostics, {
          lnum     = tonumber(lnum) - 1,
          col      = 0,
          message  = msg,
          severity = vim.diagnostic.severity.ERROR,
          source   = 'glslangValidator',
        })
      end
    end
    return diagnostics
  end,
}

lint.linters_by_ft = { glsl = { 'glslangValidator' } }

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'BufReadPost' }, {
  pattern = { '*.glsl', '*.vert', '*.frag', '*.geom', '*.comp', '*.tesc', '*.tese' },
  callback = function() lint.try_lint() end,
})
