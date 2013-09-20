set exrc " needed to make vroom work

set shell=/bin/bash

set nocompatible

" persistent undo
set undofile
set undodir=~/.undo

runtime macros/matchit.vim

set encoding=utf-8 " one encoding to rule them all

syntax on " turn on syntax highlighting


filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'gregsexton/VimCalc'
Bundle 'godlygeek/tabular'
Bundle 'altercation/vim-colors-solarized'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/html5.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'jnwhiteh/vim-golang'

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
set iskeyword+=- " treat words separated by a dash as a single word (CSS selectors!)

" scroll through command history
cnoremap <c-j> <down>
cnoremap <c-k> <up>

" omni completion
if has("autocmd") && exists("+omnifunc")
  if exists("+omnifunc")
    autocmd Filetype *
      \ if &omnifunc == "" |
      \   setlocal omnifunc=syntaxcomplete#Complete |
      \ endif
  endif
endif


if has("autocmd")
  autocmd FileType objc,c setlocal ts=4 sts=4 sw=4 expandtab
  autocmd BufRead,BufNewFile {*.go} setlocal ts=4 sts=4 sw=4 expandtab
  autocmd BufRead,BufNewFile {*.markdown,*.md} set linebreak spell
  autocmd BufRead,BufNewFile {Gemfile} setf ruby

  autocmd FileType {eruby,javascript,scss,sass,css,html} setlocal noexpandtab
endif


command! Md !markdown % | bcat
command! Strip %s/\s\+$// | w | noh

" Brett's 'switch between header/implementation files' bro
function! Switch()
  if expand('%:e') == 'h'
    try | find %:t:r.m
    catch
      try | find %:t:r.mm
      catch
        try | find %:t:r.c
        catch
          try | find %:t:r.cc
          catch
            try | find %:t:r.cpp | catch | endtry
          endtry
        endtry
      endtry
    endtry
  else
    find %:t:r.h
  endif
endfunction
command! Switch call Switch()


let mapleader = ","

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

map <leader>i :set list!<CR>
map <leader>t :NERDTreeToggle<CR>

map <leader>ne :set noexpandtab<CR>

map <leader>f :FufFile<CR>
map <leader>F :FufFileWithCurrentBufferDir<CR>
map <leader>b :FufBuffer<CR>
map <leader>/ :FufFile **/<CR>
map <leader>r :FufRenewCache<CR>
map <leader>x :call HexHighlight()<CR>
map <leader>w <C-w>w
map <leader>W <C-w>W
map <leader>A :Ack
map <leader>m :silent Md<CR>
map <leader>s :Switch<CR>
"map <leader>d /\(<<<<<<<\)\|\(=======\)\|\(>>>>>>>\)<CR>

" Tabular.vim
nmap <Leader>a= :Tabularize /=>\=<CR>
vmap <Leader>a= :Tabularize /=>\=<CR>
" nmap <Leader>a: :Tabularize /:\zs<CR>
" vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a: :Tabularize /:/l1l0<CR>
vmap <Leader>a: :Tabularize /:/l1l0<CR>
nmap <Leader>a, :Tabularize /,\zs/l0r1<CR>
vmap <Leader>a, :Tabularize /,\zs/l0r1<CR>
nmap <Leader>a* :Tabularize /\(\((^.\+\)\\|\(*\=\S\+\)\);<CR>
vmap <Leader>a* :Tabularize /\(\((^.\+\)\\|\(*\=\S\+\)\);<CR>


" enter adds blank lines
nnoremap <Enter> o<ESC>
nnoremap <S-Enter> O<ESC>
nnoremap Y y$

nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" navigate wrapped lines by holding command
vnoremap <D-j> gj
vnoremap <D-k> gk
vnoremap <D-4> g$
vnoremap <D-6> g^
vnoremap <D-0> g^
nnoremap <D-j> gj
nnoremap <D-k> gk
nnoremap <D-4> g$
nnoremap <D-6> g^
nnoremap <D-0> g^

ino <C-/> <C-r>=TriggerSnippet()<CR>
snor <C-/> <ESC>i<right><C-r>=TriggerSnippet()<CR>


" keep tmp files in a safe place
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" ruler
set ruler
set rulerformat=%25(%n%m%r:\ %y\ [%l,%v]\ %p%%%)


colorscheme solarized


let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'


" GUI prefs
if has("gui_running")
  " transparent background
  set go-=T
  set bg=dark
  if &background == "dark"
    " hi normal guibg=black
    set transp=2
  end

  " one font to rule them all
  set guifont=Monaco:h13

  " set guioptions=egmrt
  set go-=r

  set lines=999 columns=120

  set fuoptions=maxvert
endif


highlight clear SignColumn

set noballooneval " disable hover tooltips
