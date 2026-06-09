-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
--  See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Enable break indent
vim.o.breakindent = true

-- Enable undo/redo changes even after closing and reopening a file
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-guide-options`
vim.o.list = false
vim.opt.listchars = { tab = '▸ ', trail = '·', nbsp = '␣', eol = '¬' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 3

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- [[ Chris customizations ]]

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
