require'nvim-treesitter.configs'.setup {
    -- ensure_installed can be "all" or a list of languages { "python", "javascript" }
    ensure_installed = "maintained",
    highlight = {
      enable = true,
      extended_mode = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true
    },
}
