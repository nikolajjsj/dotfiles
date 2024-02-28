--[[
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||        NVIM        ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||                    ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
--]]

require("config.autocmds")
require("config.keymaps")
require("config.options")

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.autocomplete"),
	require("plugins.autoformat"),
	require("plugins.gitsigns"),
	require("plugins.lsp"),
	require("plugins.mini"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.which-key"),

	"github/copilot.vim",
	"folke/neodev.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tpope/vim-sleuth",
	"numToStr/Comment.nvim",
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd.colorscheme("kanagawa")
		end,
	},
}, {})
