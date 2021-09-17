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
    vim_dadbod_completion = true,
    treesitter = {kind = "  "},
    emoji = {kind = " ﲃ  (Emoji)", filetypes={"markdown", "text"}}
  },
  sources = {
    { name = 'nvim_lsp'},
    -- For vsnip user.
    { name = 'vsnip' },
    { name = 'buffer' },
  }
})

