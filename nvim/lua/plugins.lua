vim.cmd [[packadd packer.nvim]]

function getConfig(name)
	return string.format('require("plugins/%s")', name)
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use({'projekt0n/github-nvim-theme', config = getConfig("theme")})
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = getConfig("treesitter"),
  })
  use({'neovim/nvim-lspconfig', config = getConfig("lsp")})
  use({
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = getConfig("telescope"),
  })
  use({'hoob3rt/lualine.nvim', config = getConfig("lualine")})
  -- Completion
  use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
		},
		config = getConfig("cmp"),
	})
  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- GO packages
  use({ "ray-x/go.nvim", config = getConfig("go"), ft = { "go" } })
  -- tpope
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
end)
