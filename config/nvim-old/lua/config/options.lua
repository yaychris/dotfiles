local opt = vim.opt

-- Encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Line settings
opt.number = true
opt.cursorline = true

-- Whitespace
opt.autoindent = true
opt.expandtab = true
opt.smarttab = true
opt.softtabstop = 2
opt.tabstop = 2
opt.shiftwidth = 2

-- Buffer & window
opt.hidden = true
opt.scrolloff = 3
opt.laststatus = 2

-- Search
opt.hlsearch = true
opt.incsearch = true

-- Misc
opt.history = 1000
opt.showcmd = true
opt.showmode = true
opt.visualbell = true
opt.listchars = {
  tab = '▸ ',
  eol = '¬',
  trail = '·',
}
-- opt.iskeyword += -

-- set backspace=indent,eol,start
-- set backupdir=~/.vim/tmp/backup
-- set dir=~/.vim/tmp/swap/
-- set exrc
-- set shell=/bin/bash
-- set undodir=~/.vim/tmp/backup
-- set undofile
-- set wildignore=*.DS_Store,*.dSYM,*.log,*.o,*.ss~
-- set wildmode=list:longest
-- set backupcopy=yes
