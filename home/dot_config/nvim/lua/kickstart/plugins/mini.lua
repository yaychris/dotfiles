local gh = require('util').gh

vim.pack.add { gh 'nvim-mini/mini.nvim' }

require('mini.ai').setup {
  -- NOTE: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}

-- Add/delete/replace surroundings (brackets, quotes, etc.)
-- CHRIS: this breaks built-in substitute command, so remove for now
-- require('mini.surround').setup()

require('mini.icons').setup {}

local statusline = require 'mini.statusline' -- blah
statusline.setup { use_icons = vim.g.have_nerd_font }

-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function() return '%2l:%-2v' end

-- ... and there is more!
--  Check out: https://github.com/nvim-mini/mini.nvim

-- -- Short mode labels, color-coded by mode
-- ---@diagnostic disable-next-line: duplicate-set-field
-- statusline.section_mode = function(args)
--   local mode_map = {
--     ['n']   = { label = 'N', hl = 'MiniStatuslineModeNormal' },
--     ['i']   = { label = 'I', hl = 'MiniStatuslineModeInsert' },
--     ['v']   = { label = 'V', hl = 'MiniStatuslineModeVisual' },
--     ['V']   = { label = 'V', hl = 'MiniStatuslineModeVisual' },
--     ['\22'] = { label = 'V', hl = 'MiniStatuslineModeVisual' },
--     ['R']   = { label = 'R', hl = 'MiniStatuslineModeReplace' },
--     ['c']   = { label = 'C', hl = 'MiniStatuslineModeCommand' },
--     ['s']   = { label = 'S', hl = 'MiniStatuslineModeOther' },
--     ['S']   = { label = 'S', hl = 'MiniStatuslineModeOther' },
--     ['\19'] = { label = 'S', hl = 'MiniStatuslineModeOther' },
--     ['t']   = { label = 'T', hl = 'MiniStatuslineModeOther' },
--   }
--   local info = mode_map[vim.fn.mode()] or { label = '-', hl = 'MiniStatuslineModeOther' }
--   return info.label, info.hl
-- end
--
-- -- Filetype + encoding only (drop file size and line endings)
-- ---@diagnostic disable-next-line: duplicate-set-field
-- statusline.section_fileinfo = function(args)
--   local filetype = vim.bo.filetype
--   if filetype == '' or MiniStatusline.is_truncated(args.trunc_width) then return '' end
--
--   local encoding = vim.bo.fileencoding ~= '' and vim.bo.fileencoding or vim.o.encoding
--   local enc_str = (encoding ~= 'utf-8') and encoding or ''
--
--   return table.concat(
--     vim.tbl_filter(function(s) return s ~= '' end, { filetype, enc_str }),
--     ' '
--   )
-- end

-- -- Custom active statusline layout
-- ---@diagnostic disable-next-line: duplicate-set-field
-- statusline.config.content.active = function()
--   local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
--   local git           = statusline.section_git { trunc_width = 40 }
--   local diagnostics   = statusline.section_diagnostics { trunc_width = 75 }
--   local filename      = statusline.section_filename { trunc_width = 140 }
--   local lsp           = statusline.section_lsp { trunc_width = 75 }
--   local fileinfo      = statusline.section_fileinfo { trunc_width = 120 }
--   local location      = statusline.section_location { trunc_width = 75 }
--
--   return MiniStatusline.combine_groups {
--     { hl = mode_hl,                  strings = { mode } },
--     { hl = 'MiniStatuslineDevinfo',  strings = { git, diagnostics } },
--     '%<',
--     { hl = 'MiniStatuslineFilename', strings = { filename } },
--     '%=',
--     { hl = 'MiniStatuslineDevinfo',  strings = { lsp } },
--     { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
--     { hl = mode_hl,                  strings = { location } },
--   }
-- end
