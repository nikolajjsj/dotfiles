vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use('neovim/nvim-lspconfig')
  use({'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}})
  use('hoob3rt/lualine.nvim')
  -- Completion
  use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
		},
	})
  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- tpope
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  -- Auto pair
  use 'jiangmiao/auto-pairs'
  -- diagnostics
  use{
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  -- Themes
  use('folke/tokyonight.nvim')
  use('projekt0n/github-nvim-theme')
end)
