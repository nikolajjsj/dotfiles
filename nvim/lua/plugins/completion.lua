local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['K'] = cmp.mapping.scroll_docs(-4),
    ['J'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
  },
  source = {
    path = {kind = "   (Path)"},
    buffer = {kind = "   (Buffer)"},
    calc = {kind = "   (Calc)"},
    vsnip = {kind = "   (Snippet)"},
    nvim_lsp = {kind = "   (LSP)"},
    nvim_lua = {kind = "  "},
    spell = {kind = "   (Spell)"},
    tags = false,
    treesitter = {kind = "  "},
    emoji = {kind = " ﲃ  (Emoji)", filetypes={"markdown", "text"}}
  },
  sources = {
    { name = 'nvim_lsp'},
    -- For vsnip user.
    { name = 'luasnip' },
    { name = 'buffer' },
  }
})

