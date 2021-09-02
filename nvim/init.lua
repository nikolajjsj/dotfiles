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
vim.opt.lazyredraw = true
vim.opt.ignorecase = true
vim.opt.backspace='start,eol,indent'
vim.opt.formatoptions = vim.opt.formatoptions + 'r'
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'

-- au BufNewFile,BufRead *.es6 setf javascript " JavaScript
-- au BufNewFile,BufRead *.tsx setf typescriptreact " TypeScript
-- au BufNewFile,BufRead *.md set filetype=markdown " Markdown
-- set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md
-- 
-- filetype plugin indent on

-- Setting leader key to space
vim.g.mapleader = " "

-- Sourcing plugins and mappin
require('maps') -- ~/.config/nvim/maps.vim
require('plugins') -- ~/.config/nvim/plugins.vim
require('theme') -- ~/.config/nvim/theme.vim

-- Lua plugins configurations
require('lsp')
require('treesitter')
require('completion')
require('statusbar')
require('commenter')
require('autopair')
require('telescopes')
require('buffer')
require('lsp-color')
require('saga')
require('gitsigns').setup()

