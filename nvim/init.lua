local api = vim.api
local g = vim.g
local opt = vim.opt
local map = api.nvim_set_keymap

--Remap space as leader key
g.mapleader = ' '
-- Disable builtins
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1

-- Quickly edit and source neovim config
map('n', '<leader>ve', ':edit ~/code/.dotfiles/nvim/init.lua<cr>', { noremap = true })
map('n', '<leader>vr', ':source ~/code/.dotfiles/nvim/init.lua<cr>', { noremap = true })
-- Quick switch between two last opened buffer
map('n', '<leader><leader>', '<c-^>', { noremap = true})
-- Line navigation
map('n', 'H', '^', {})
map('n', 'L', '$', {})
-- Navigation between windows
map('', '<leader>h', ':wincmd h<CR>', {})
map('', '<leader>j', ':wincmd j<CR>', {})
map('', '<leader>k', ':wincmd k<CR>', {})
map('', '<leader>l', ':wincmd l<CR>', {})
-- Split window
map('n', 'ss', ':split<Return><C-w>w', {})
map('n', 'sv', ':vsplit<Return><C-w>w', {})
-- Open Terminal in split window
map('n', '<Leader>t', ':below 10sp term://$SHELL<CR>i', { noremap = true })
-- Better Visual lines and handling
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
map('v', '<Tab>', '>gv', { noremap = true })
map('v', '<S-Tab>', '<gv', { noremap = true })
map('v', '<', '<gv', {})
map('v', '>', '>gv', {})

-- Setting options
opt.hidden = true
opt.colorcolumn = '80'
opt.signcolumn = 'yes'
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.smarttab = true
opt.smartindent = true
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
opt.wildmode = { "longest", "full" }
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.relativenumber = true -- Show line numbers
opt.number = true -- But show the actual number for the line we're on
opt.updatetime = 1000 -- Make updates happen faster
opt.lazyredraw = true
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor

-- Theming
vim.o.background = 'dark'
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'
vim.cmd([[colorscheme gruvbox]])

-- Sourcing plugins and mappings
require('plugins')
require('theme')

-- Lua plugins configurations
require('plugins.lsp')
require('plugins.lsp-saga')
require('plugins.treesitter')
require('plugins.completion')
require('plugins.statusbar')
require('plugins.telescopes')

