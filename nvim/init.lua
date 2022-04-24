-- d8b   db d888888b db   dD  .d88b.  db       .d8b.     d88b    d88b .d8888.    d88b 
-- 888o  88   `88'   88 ,8P' .8P  Y8. 88      d8' `8b    `8P'    `8P' 88'  YP    `8P' 
-- 88V8o 88    88    88,8P   88    88 88      88ooo88     88      88  `8bo.       88  
-- 88 V8o88    88    88`8b   88    88 88      88~~~88     88      88    `Y8b.     88  
-- 88  V888   .88.   88 `88. `8b  d8' 88booo. 88   88 db. 88  db. 88  db   8D db. 88  
-- VP   V8P Y888888P YP   YD  `Y88P'  Y88888P YP   YP Y8888P  Y8888P  `8888Y' Y8888P  

-- Sourcing plugins, remaps and settings



local g = vim.g
local opt = vim.opt
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Ignore files
opt.wildignore:append('**/node_modules/*')
opt.wildignore:append('**/android/*')
opt.wildignore:append('**/ios/*')
opt.wildignore:append('**/.git/*')
opt.wildignore:append('**/coverage/*')
--Remap space as leader key
g.mapleader = ' '
-- Setting options
opt.hidden = true
opt.colorcolumn = '80'
opt.signcolumn = 'yes'
opt.splitbelow = true
opt.splitright = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.smarttab = true
opt.smartindent = true
opt.ignorecase = true
opt.backspace='start,eol,indent'
opt.mouse = 'a'
opt.wrap = false
opt.clipboard = 'unnamedplus'
opt.relativenumber = true -- Show line numbers
opt.number = true -- But show the actual number for the line we're on
opt.lazyredraw = true
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor
-- Theming
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')
    
-- Quick switch between two last opened buffer
map('n', '<leader><leader>', '<c-^>', opts)
-- Toggle explore to the left
map('n', '<leader>e', ':Lex 30<cr>', opts)
-- Navigation between windows
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
-- Resize with arrows
map('n', '<Up>', ':resize -2<cr>', opts)
map('n', '<Down>', ':resize +2<cr>', opts)
map('n', '<Left>', ':vertical resize +2<cr>', opts)
map('n', '<Right>', ':vertical resize -2<cr>', opts)
-- Split window
map('n', 'ss', ':split<Return><C-w>w', opts)
-- Awesome stuff
map('n', '<Leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', opts)
map('n', '<Leader>F', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>', opts)
map('n', '<Leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<Leader>K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
vim.cmd([[
  augroup highlight_yank
      autocmd!
      autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
  augroup END
]])

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end
vim.api.nvim_command("packadd packer.nvim")
require("packer").startup({
  function(use)
    -- Packer can manage itself as an optional usein
    use{"wbthomason/packer.nvim"}
    use{"gruvbox-community/gruvbox"}
    use{"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use{"neovim/nvim-lspconfig"}
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/plenary.nvim'}} 
    }
    use{
      "hrsh7th/nvim-cmp",
      requires = {
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-cmdline"},
        {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-vsnip"},
        {"hrsh7th/vim-vsnip"},
      },
    }
    use{"hoob3rt/lualine.nvim"}
    use{"tpope/vim-commentary"}
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
  },
})

require"lsp"
require"telescope"
require"cmp"
require"treesitter"
require"lualine"
