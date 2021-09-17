vim.opt.cmdheight = 1
vim.opt.colorcolumn = '80'
vim.opt.signcolumn = 'yes'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.scrolloff = 20
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.ignorecase = true
vim.opt.backspace='start,eol,indent'
vim.opt.formatoptions = vim.opt.formatoptions + 'r'
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.wrap = false
vim.opt.updatetime = 300
vim.opt.lazyredraw = true
vim.o.completeopt = 'menuone,noselect'

-- Setting leader key to space
vim.g.mapleader = " "

-- Sourcing plugins and mappin
require('plugins') -- ~/.config/nvim/plugins.vim
require('mappings') -- ~/.config/nvim/maps.vim
require('theme') -- ~/.config/nvim/theme.vim

-- Lua plugins configurations
require('plugins.lsp')
require('plugins.treesitter')
require('plugins.completion')
require('plugins.statusbar')
require('plugins.commenter')
require('plugins.autopair')
require('plugins.telescopes')
-- Non config(-ed) plugins
require('gitsigns').setup()

