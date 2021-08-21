require'nvim-treesitter.configs'.setup {
    -- ensure_installed can be "all" or a list of languages { "python", "javascript" }
    ensure_installed = {
      "dart",
      "python",
      "bash",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "scss",
      "lua",
      "vue",
      "json"
    },

    highlight = {
      enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
      disable = {},
    },

    indent = {
      enable = false,
      disable = {},
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

