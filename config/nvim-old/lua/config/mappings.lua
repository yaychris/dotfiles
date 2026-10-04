vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local keymap = vim.keymap

keymap.set('n', '<leader>i', '<cmd>set list!<cr>')
keymap.set('n', '<leader>g', ':e %:.:h/')
keymap.set('n', '<leader>c', ':saveas %:p:h/')

-- Faster scrolling
keymap.set('n', '<C-e>', '4<C-e>')
keymap.set('n', '<C-y>', '4<C-y>')

-- Faster search and replace
keymap.set('n', '<leader>s', ':%s//g<left><left>')
keymap.set('v', '<leader>s', ':s//g<left><left>')

-- Search for selected text with //
-- vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
keymap.set('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])

-- Clear search results
keymap.set('n', '<C-l>', '<cmd>noh<cr>')

-- Center search results
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')
keymap.set('n', '*', '*zz')
keymap.set('n', '#', '#zz')

-- nnoremap <leader>t :NERDTreeToggle<CR>

-- " Fzf
-- nnoremap <leader>f :Files<CR>
-- nnoremap <leader>F :Files %:p:h<CR>
-- nnoremap <leader>b :Buffers<CR>

-- " Faster search and replace
-- noremap <leader>s :%s//g<LEFT><LEFT>
-- vnoremap <leader>s :s//g<LEFT><LEFT>

-- " Open
-- nnoremap <leader>G :OpenGithubFile<CR>
-- vnoremap <leader>G :OpenGithubFile<CR>

-- " Scroll through command history
-- cnoremap <c-n> <down>
-- cnoremap <c-p> <up>

-- " delete without yanking
-- " nnoremap <leader>d "_d
-- " vnoremap <leader>d "_d

-- " replace currently selected text with default register
-- " without yanking it
-- vnoremap <leader>p "_dP

-- " ALE
-- nnoremap <leader>d :ALEGoToDefinition<CR>
-- nnoremap <leader>r :ALEFindReferences<CR>
-- nnoremap <leader>j :ALEHover<CR>
-- nnoremap <leader>N :ALEPreviousWrap<CR>
-- nnoremap <leader>n :ALENextWrap<CR>

-- " EasyAlign
-- xmap ga <Plug>(EasyAlign)
-- nmap ga <Plug>(EasyAlign)

-- " Convert the current visual selection into a Decimal without quotes
-- " e.g. 1.5 to new Decimal(1.5)
-- vnoremap <leader>T <ESC>`>a)<ESC>`<inew Decimal(<ESC>
-- " Convert the current visual selection into a Decimal with quotes
-- " e.g. 1.5 to new Decimal('1.5')
-- vnoremap <leader>D <ESC>`>a')<ESC>`<inew Decimal('<ESC>

-- " " Convert the current visual selection into a BigDecimal
-- " " e.g. 1.5 to BigDecimal('1.5')
-- " vnoremap <leader>d <ESC>`>a')<ESC>`<iBigDecimal('<ESC>

-- " " IQT
-- " nnoremap <leader>m o"va-vsrv-github.a.internal/it/malinois/"<LEFT>

-- " " Sonic Pi
-- " nnoremap <leader>R :SonicPiSendBuffer<CR>
-- " nnoremap <leader>S :SonicPiStop<CR>

-- " " Shaden
-- " vnoremap <C-S-P> :<C-U>ShadenPatchSelection<CR>
-- " nnoremap <C-S-P> :<C-U>ShadenPatchLine<CR>
