-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic Config & Keymaps
--  See `:help vim.diagnostic.Opts`
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})


-- [[ Chris customizations ]]

-- toggle display of invisible characters
vim.keymap.set('n', '<leader>i', '<cmd>set list!<CR>', { desc = 'Toggle [I]nvisible characters' })

-- open file browser in the directory of the current file
vim.keymap.set('n', '<leader>g', ':e %:.:h/', { desc = 'Browse current file directory' })

-- save a copy of the current file in the same directory
vim.keymap.set('n', '<leader>c', ':saveas %:p:h/', { desc = '[C]opy file to same directory' })

-- scroll 4 lines at a time instead of 1
vim.keymap.set('n', '<C-e>', '4<C-e>', { desc = 'Scroll down faster' })
vim.keymap.set('n', '<C-y>', '4<C-y>', { desc = 'Scroll up faster' })

-- search and replace in entire file
vim.keymap.set('n', '<leader>S', ':%s//g<LEFT><LEFT>', { desc = '[S]earch and replace in file' })
vim.keymap.set('v', '<leader>S', ':s//g<LEFT><LEFT>', { desc = '[S]earch and replace in selection' })

-- jump to next diff conflict marker
vim.keymap.set('n', '<leader>e', '/<<<<<<<\\|=======\\|\\|\\|\\|\\|\\|\\|\\|>>>>>>><CR>', { desc = 'Jump to next conflict marker' })

-- center screen after each search jump
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')

-- scroll command history with ctrl-n/p
vim.keymap.set('c', '<C-n>', '<down>', { desc = 'Next command history entry' })
vim.keymap.set('c', '<C-p>', '<up>', { desc = 'Previous command history entry' })

-- paste over selection without yanking replaced text
vim.keymap.set('v', '<leader>p', '"_dP', { desc = 'Paste without yanking' })

-- search for visually selected text
vim.keymap.set('v', '//', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>', { desc = 'Search for selection' })

-- strip trailing whitespace
vim.api.nvim_create_user_command('StripWhitespace', '%s/\\s\\+$//e | noh', {})

-- wrap at word boundaries in markdown
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function() vim.o.linebreak = true end,
})
