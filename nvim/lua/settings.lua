local g = vim.g
local opt = vim.opt

--Remap space as leader key
g.mapleader = ' '
-- Disable builtins
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1

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
opt.completeopt = { "menu", "menuone", "noselect" }
opt.shortmess:append('c')

-- Theming
vim.o.background = 'dark'
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'
vim.cmd('colorscheme gruvbox')
