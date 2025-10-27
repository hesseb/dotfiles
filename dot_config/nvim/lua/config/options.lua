vim.cmd("language en_US")
vim.cmd("syntax on")

vim.o.shell = "zsh"

vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 2 -- Amount to indent with << and >>
vim.opt.tabstop = 2 -- How many spaces are shown per Tab
vim.opt.softtabstop = 2 -- How many spaces are applied when pressing Tab

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- Keep identation from previous line

vim.g.have_nerd_font = true

vim.opt.breakindent = true

-- Always show relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.wo.nu = true
vim.wo.relativenumber = true

vim.opt.termguicolors = true

-- Show line under cursor
vim.o.colorcolumn = "121"
vim.opt.cursorline = true

-- Store undos between sessions
vim.opt.undofile = true

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Configure how new splits should be opened
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'` and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
