set nocompatible

set encoding=utf-8 " one encoding to rule them all

runtime macros/matchit.vim

syntax on " turn on syntax highlighting
filetype plugin indent on " turn on file type detection

set number " line numbers

set hidden " allow unsaved buffers in the background

set tabstop=2 " width of a tab
set shiftwidth=2 " width of shift (< and >)
set softtabstop=2 " width of expandtab
set smarttab " do the right thing
set expandtab " use spaces instead of tabs

set autoindent " smart indenting

set backspace=indent,eol,start " sensible backspacing

set history=1000 " longer history

set incsearch " hightlight as you type
set hlsearch " highlight matches

set scrolloff=3 " buffer around window

set showcmd " show commands as they're typed
set showmode " display the current mode

set wildmenu " fancy command line completion menu
set wildmode=list:longest " complete files like a shell
set wildignore=*.log,*.o,*.ss~ " files to ignore

set visualbell " no sound

set listchars=tab:▸\ ,eol:¬

let mapleader = ","
map <leader>i :set list!<CR>
map <leader>t :NERDTreeToggle<CR>
map <leader>f :LustyFilesystemExplorer<CR>
map <leader>F :LustyFilesystemExplorerFromHere<CR>
map <leader>b :LustyBufferExplorer<CR>
" fuzzy finder recursive (until lusty catches up)
map <leader>/ :FufFileRecursive<CR>

" enter adds blank lines
map <Enter> o<ESC>
map <S-Enter> O<ESC>

nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" keep tmp files in a safe place
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" ruler
set ruler
set rulerformat=%25(%n%m%r:\ %Y\ [%l,%v]\ %p%%%)

colorscheme vividchalk

" GUI prefs
if has("gui_running")
  " transparent background
  set go-=T
  set bg=dark
  if &background == "dark"
    hi normal guibg=black
    set transp=7
  end

  " one font to rule them all
  set guifont=Monaco:h13

  " set guioptions=egmrt

  set lines=999 columns=80

  set fuoptions=maxvert,maxhorz
endif
