set exrc " needed to make vroom work

set nocompatible

" persistent undo
set undofile
set undodir=~/.undo

set encoding=utf-8 " one encoding to rule them all

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

" set wildmenu " fancy command line completion menu
set wildmode=list:longest " complete files like a shell
set wildignore=*.DS_Store,*.dSYM,*.log,*.o,*.ss~ " files to ignore

set visualbell " no sound

set listchars=tab:▸\ ,eol:¬

let mapleader = ","
map <leader>i :set list!<CR>
map <leader>t :NERDTreeToggle<CR>
map <leader>f :FufFile<CR>
map <leader>F :FufFileWithCurrentBufferDir<CR>
map <leader>b :FufBuffer<CR>
map <leader>/ :FufFileRecursive<CR>
map <leader>r :FufRenewCache<CR>

" enter adds blank lines
map <Enter> o<ESC>
map <S-Enter> O<ESC>

nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" navigate wrapped lines by holding command
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" keep tmp files in a safe place
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" ruler
set ruler
set rulerformat=%25(%n%m%r:\ %Y\ [%l,%v]\ %p%%%)

colorscheme oceandeep

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
  set go-=r

  set lines=999 columns=80

  set fuoptions=maxvert
endif
