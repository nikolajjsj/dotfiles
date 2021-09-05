local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
  },
  source = {
    path = {kind = "   (Path)"},
    buffer = {kind = "   (Buffer)"},
    calc = {kind = "   (Calc)"},
    vsnip = {kind = "   (Snippet)"},
    nvim_lsp = {kind = "   (LSP)"},
    nvim_lua = {kind = "  "},
    nvim_lua = false,
    spell = {kind = "   (Spell)"},
    tags = false,
    vim_dadbod_completion = true,
    -- snippets_nvim = {ind = "  "},
    treesitter = {kind = "  "},
    emoji = {kind = " ﲃ  (Emoji)", filetypes={"markdown", "text"}}
  }
})

