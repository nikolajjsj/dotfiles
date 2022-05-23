require("packages")

vim.g.mapleader = " "
vim.o.number  =true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.tabstop = 2
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.swapfile = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 10
vim.o.shiftwidth = 2
vim.o.numberwidth = 4
vim.o.termguicolors = true
vim.o.colorcolumn = '80'
vim.o.showtabline = 2
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'
vim.o.background = 'dark'

local opts = { noremap = true, silent = true}
local map = vim.api.nvim_set_keymap
-- Remaps
map("n", "<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)
map('n', '<C-N>', ":Lexplore<CR> :vertical resize 30<CR>", opts)
map('n', 'te', ':tabedit', opts)
map('n', '<S-Tab>', ':tabprev<Return>', opts)
map('n', '<Tab>', ':tabnext<Return>', opts)
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

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'wbthomason/packer.nvim'
  use 'projekt0n/github-nvim-theme'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'neovim/nvim-lspconfig'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}} 
  }
  use 'hoob3rt/lualine.nvim'
  use 'tpope/vim-commentary'
  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
end)
