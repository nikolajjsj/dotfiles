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
  -- normal (alhtough tpope)
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  -- themes
  use 'gruvbox-community/gruvbox'
  -- neovim plugins
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'folke/lsp-colors.nvim'
  use 'kabouzeid/nvim-lspinstall'
  use 'ray-x/lsp_signature.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-buffer'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'terrortylor/nvim-comment'
  use 'windwp/nvim-autopairs'
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'lewis6991/gitsigns.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
end)
