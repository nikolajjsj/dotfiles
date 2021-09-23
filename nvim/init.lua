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
vim.opt.writebackup = false
vim.opt.wrap = false
vim.opt.updatetime = 300
vim.opt.lazyredraw = true
vim.opt.clipboard = 'unnamedplus'

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.cmd([[filetype plugin indent on]]) --- " Enables plugin & indent
vim.cmd([[set formatoptions-=c]])      --- " Stop newline continuation of comments
vim.cmd([[set completeopt=menuone,noselect]])
-- Make background transparent
vim.cmd([[highlight Normal guibg=none]])
vim.cmd([[highlight NonText guibg=none]])
vim.cmd([[highlight Normal ctermbg=none]])
vim.cmd([[highlight NonText ctermbg=none]])

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
require('plugins.flutter_lsp')
-- Non config(-ed) plugins
require('gitsigns').setup()
