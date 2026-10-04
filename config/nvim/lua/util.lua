local M = {}

function M.gh(repo)
  return 'https://github.com/' .. repo
end

-- Wraps treesitter's indentexpr with a fallback for incomplete syntax trees.
-- Treesitter works well for `=` (re-indent on complete code) but returns -1
-- when the tree is in an error state (e.g. typing a new line inside an open
-- block before the closing brace). The fallback checks the previous line for
-- a block-opening character and adds one shiftwidth if found.
function M.ts_indent_with_fallback(openers)
  local ts = require('nvim-treesitter').indentexpr()
  if ts >= 0 then return ts end

  local prev = vim.fn.prevnonblank(vim.v.lnum - 1)
  if prev == 0 then return 0 end

  local indent = vim.fn.indent(prev)
  if vim.fn.getline(prev):match(openers .. '%s*$') then
    indent = indent + vim.bo.shiftwidth
  end
  return indent
end

-- indentexpr for brace-based languages (Odin, C-like)
function M.brace_indent()
  return M.ts_indent_with_fallback '[{([]'
end

-- indentexpr for colon-based languages (GDScript, Python-like)
function M.colon_indent()
  return M.ts_indent_with_fallback '[{([:[]'
end

return M
