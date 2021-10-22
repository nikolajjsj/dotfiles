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
  use 'nvim-lua/lsp-status.nvim'
  use {
    "akinsho/flutter-tools.nvim",
    ft = { "flutter", "dart" },
    requires = 'nvim-lua/plenary.nvim',
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
          {silent = true, noremap = true}
        )
      }
    end
  }
  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"
  use 'onsails/lspkind-nvim'
  -- Snippet plugin
  use 'L3MON4D3/LuaSnip'
  -- normal (alhtough tpope)
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  -- themes
  use 'gruvbox-community/gruvbox'
  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  -- Autopairs
  use 'windwp/nvim-autopairs'
  -- Lualine
  use 'hoob3rt/lualine.nvim'
  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  -- Gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }
end)
