vim.cmd("autocmd!")
-- Leader
vim.g.mapleader = " "
-- Options
vim.o.nu = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.errorbells = false
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.wrap = false
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.scrolloff = 10
vim.o.wrap = false -- No Wrap lines
vim.o.mouse = 'nv'
-- File stuff
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.wildignore:append { '*/node_modules/*' }
-- MacOS
vim.opt.clipboard:append { 'unnamedplus' }
-- Visual stuff
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.background = 'dark'

require"plugins"
require"maps"
