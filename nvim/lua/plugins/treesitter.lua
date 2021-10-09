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
      "json",
      "go"
    },

    highlight = {
      enable = true,
      extended_mode = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

