local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute('packadd packer.nvim')
end

return require('packer').startup(function()
  -- Packer can manage itself as an optional usein
  use {'wbthomason/packer.nvim', opt = true}
  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'ray-x/lsp_signature.nvim'
  use 'glepnir/lspsaga.nvim'
  -- cmp + vsnip
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- Friendly snippets
  use 'rafamadriz/friendly-snippets'
  -- normal (alhtough tpope)
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  -- themes
  use 'gruvbox-community/gruvbox'
  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  -- Autopairs
  use 'windwp/nvim-autopairs'
  -- Lualine
  use 'hoob3rt/lualine.nvim'
  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  -- Gitsigns
  use 'lewis6991/gitsigns.nvim'
end)
