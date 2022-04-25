-- d8b   db d888888b db   dD  .d88b.  db       .d8b.     d88b    d88b .d8888.    d88b 
-- 888o  88   `88'   88 ,8P' .8P  Y8. 88      d8' `8b    `8P'    `8P' 88'  YP    `8P' 
-- 88V8o 88    88    88,8P   88    88 88      88ooo88     88      88  `8bo.       88  
-- 88 V8o88    88    88`8b   88    88 88      88~~~88     88      88    `Y8b.     88  
-- 88  V888   .88.   88 `88. `8b  d8' 88booo. 88   88 db. 88  db. 88  db   8D db. 88  
-- VP   V8P Y888888P YP   YD  `Y88P'  Y88888P YP   YP Y8888P  Y8888P  `8888Y' Y8888P  

-- Sourcing plugins, remaps and settings
require("basic")




require('github-theme').setup({
  theme_style = "dark_default",
})
require('telescope').setup{}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "phpdoc" },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}
-- require('cmp').setup({
--   snippet = {
--     expand = function(args)
--       vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-e>'] = cmp.mapping.abort(),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--   }),
--   sources = cmp.config.sources({
--     { name = 'nvim_lsp' },
--     { name = 'vsnip' }, -- For vsnip users.
--     { name = buffer },
--   })
-- })
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = 'github',
    section_separators = {'', ''},
    component_separators = {'', ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
})
local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local util = require "lspconfig/util"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false})

local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.mod", ".git"),
}
lspconfig.tsserver.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue"
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
local servers = { 
  'pyright', 
  'vuels', 
  'bashls', 
  'cssls', 
  'html', 
  'sqlls', 
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'gruvbox-community/gruvbox'
  use 'projekt0n/github-nvim-theme'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'neovim/nvim-lspconfig'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}} 
  }
  -- use {
  --   'hrsh7th/nvim-cmp',
  --   requires = {
  --     {'hrsh7th/cmp-nvim-lsp'},
  --     {'hrsh7th/cmp-buffer'},
  --     {'hrsh7th/cmp-cmdline'},
  --     {'hrsh7th/cmp-path'},
  --     {'hrsh7th/cmp-vsnip'},
  --     {'hrsh7th/vim-vsnip'},
  --   },
  -- }
  use 'hoob3rt/lualine.nvim'
  use 'tpope/vim-commentary'
end)

