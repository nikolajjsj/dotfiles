require'nvim-treesitter.configs'.setup {
    -- ensure_installed can be "all" or a list of languages { "python", "javascript" }
    ensure_installed = {"python", "bash", "javascript", "typescript", "dart", "html", "css", "lua"},

    highlight = { -- enable highlighting for all file types
      enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
    },
    textobjects = {
      -- These are provided by 
      select = {
        enable = true,  -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
        keymaps = {
          -- You can use the capture groups defined here:
	  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/master/queries/c/textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["as"] = "@statement.outer",
          ["is"] = "@statement.inner",
        },
      },
    },
}

