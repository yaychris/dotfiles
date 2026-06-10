-- use spaces instead of tabs
vim.o.expandtab = true

-- spaces per indent level
vim.o.shiftwidth = 2

-- visual width of a tab character
vim.o.tabstop = 2

-- spaces inserted/deleted when pressing tab/backspace
vim.o.softtabstop = 2

-- use shiftwidth when inserting tabs at line start
vim.o.smarttab = true

-- copy indent from current line when starting a new line
vim.o.autoindent = true

-- treat hyphenated-words as a single word
vim.opt.iskeyword:append '-'

-- number of command/search history entries to keep
vim.o.history = 1000

-- tab completion: list all matches and complete to longest common string
vim.o.wildmode = 'list:longest'

-- files to ignore in file completion
vim.opt.wildignore:append { '*.DS_Store', '*.dSYM', '*.log', '*.o', '*.ss~' }

-- shell used for :! commands
vim.o.shell = '/opt/homebrew/bin/fish'

-- load .nvimrc/.exrc from the current directory
vim.o.exrc = true

-- show partial command in the last line of the screen
vim.o.showcmd = true

-- flash screen instead of beeping on error
vim.o.visualbell = true

-- overwrite original file on save (needed for some file watchers)
vim.o.backupcopy = 'yes'

-- ms to wait for a key code sequence to complete
vim.o.ttimeoutlen = 100
