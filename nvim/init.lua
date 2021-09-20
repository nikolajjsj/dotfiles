vim.opt.hidden = true
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
vim.opt.sidescrolloff = 8
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.ignorecase = true
vim.opt.backspace='start,eol,indent'
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

vim.cmd [[syntax on]]
vim.cmd [[filetype plugin indent on]]

-- Sourcing plugins and mappin
require('plugins') -- ~/.config/nvim/plugins.vim
require('mappings') -- ~/.config/nvim/maps.vim
require('theme') -- ~/.config/nvim/theme.vim

-- Lua plugins configurations
require('plugins.lsp')
require('plugins.treesitter')
require('plugins.completion')
require('plugins.statusbar')
require('plugins.autopair')
require('plugins.telescopes')
-- Non config(-ed) plugins
require('gitsigns').setup()

