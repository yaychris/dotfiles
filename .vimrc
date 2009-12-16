set hidden
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=indent,eol,start
set history=1000
set number
set hlsearch
set scrolloff=3
set visualbell

set encoding=utf-8

"Customize mapleader
let mapleader = ","

" Set the default font
set guifont=Monaco:h15

" File-type highlighting and configuration
syntax on
filetype plugin on
filetype indent on

nnoremap <leader>t :NERDTreeToggle<CR>

map <leader>f :FuzzyFinderFile<CR>
map <leader>b :FuzzyFinderBuffer<CR>
let g:fuzzy_ignore = "*.log"

map <leader>h <C-w>h
map <leader>l <C-w>l

map <S-Enter> O<ESC>
map <Enter> o<ESC>

colorscheme inkpot

autocmd BufRead *.css.php set filetype=css
autocmd BufRead *.js.php	set filetype=javascript

" runtime macros/matchit.vim

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set ruler
set rulerformat=%25(%n%m%r:\ %Y\ [%l,%v]\ %p%%%)

if has("gui_running")
  set guioptions=egmrt
  set fuoptions=maxvert,maxhorz
endif


