local api = vim.api
local g = vim.g
local opt = vim.opt

--Remap space as leader key
api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
g.mapleader = ' '

opt.hidden = true
opt.cmdheight = 1
opt.colorcolumn = '80'
opt.signcolumn = 'yes'
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.smarttab = true
opt.smartindent = true
opt.sidescrolloff = 8
opt.wildmenu = true
opt.ignorecase = true
opt.backspace='start,eol,indent'
opt.cursorline = true
opt.mouse = 'a'
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.wrap = false
opt.clipboard = 'unnamedplus'
opt.wildmode = { "longest", "list", "full" }
opt.wildmode = opt.wildmode - "list"
opt.wildmode = opt.wildmode + { "longest", "full" }
opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.relativenumber = true -- Show line numbers
opt.number = true -- But show the actual number for the line we're on
opt.updatetime = 1000 -- Make updates happen faster
opt.lazyredraw = true
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor
opt.completeopt = 'menu','menuone','noselect'

-- Disable builtins
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1

g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1

-- Sourcing plugins and mappin
require('plugins')
require('mappings')
require('theme')

-- Lua plugins configurations
require('lsp')
require('plugins.treesitter')
require('plugins.completion')
require('plugins.statusbar')
require('plugins.telescopes')

-- Make background transparent
vim.cmd([[au ColorScheme * hi Normal ctermbg=none guibg=none]])


