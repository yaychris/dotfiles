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
