local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local cmp = require'cmp'
local lspkind = require "lspkind"
lspkind.init()
require('nvim-autopairs').setup()

local vim = vim
local uv = vim.loop
local set = vim.api.nvim_set_keymap

-- Function to set mappings
function mapBuf(buf, mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, options)
end

vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"
cmp.setup({
  mapping = {
    ['K'] = cmp.mapping.scroll_docs(-4),
    ['J'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 2 },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    -- Youtube: How to set up nice formatting for your sources.
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
        gh_issues = "[issues]",
      },
    },
  },
})


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false})

local M = {}

local function completionItemResolveCB(err, _, result)
  if err or not result then
    return
  end
  local bufnr = vim.api.nvim_get_current_buf()
  if result.additionalTextEdits then
    vim.lsp.util.apply_text_edits(result.additionalTextEdits, bufnr)
  end
end
local function requestCompletionItemResolve(bufnr, item)
  vim.lsp.buf_request(bufnr, "completionItem/resolve", item, completionItemResolveCB)
end
function M.on_complete_done()
  local bufnr = vim.api.nvim_get_current_buf()
  local completed_item_var = vim.v.completed_item
  if
    completed_item_var and completed_item_var.user_data and completed_item_var.user_data.nvim and
      completed_item_var.user_data.nvim.lsp and
      completed_item_var.user_data.nvim.lsp.completion_item
   then
    local item = completed_item_var.user_data.nvim.lsp.completion_item
    requestCompletionItemResolve(bufnr, item)
  end
  if
    completed_item_var and completed_item_var.user_data and completed_item_var.user_data and
      completed_item_var.user_data.lsp and
      completed_item_var.user_data.lsp.completion_item
   then
    local item = completed_item_var.user_data.lsp.completion_item
    requestCompletionItemResolve(bufnr, item)
  end
end

local on_attach = function(client, bufnr)
  mapBuf(bufnr, 'n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapBuf(bufnr, 'n', '<Leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  mapBuf(bufnr, 'n', '<Leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>')
  mapBuf(bufnr, "n", "<Leader>gh", "<CMD>lua require('lspsaga.hover').render_hover_doc()<cr>")
  mapBuf(bufnr, 'n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  mapBuf(bufnr, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  mapBuf(bufnr, 'n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  mapBuf(bufnr, "n", "<Leader>fc", '<cmd>lua vim.lsp.buf.formatting()<CR>')
  mapBuf(bufnr, "n", "<Leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_command("autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()")
    vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
    vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()")
  end

  -- Autoformatting
  -- formatting
  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
  end

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

lspconfig.vuels.setup { on_attach = on_attach, capabilities = capabilities }

configs.emmet_ls = {
  default_config = {
    cmd = {"emmet-ls", "--stdio"},
    filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {}
  }
}

lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.tsserver.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
    "vue"
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier_d_slim',
        rootPatterns = { '.git' },
        -- requiredFiles: { 'prettier.config.js' },
        args = { '--stdin', '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'prettier',
      javascriptreact = 'prettier',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'prettier',
      typescriptreact = 'prettier',
      json = 'prettier',
      markdown = 'prettier',
    }
  }
}

local vs_code_extracted = {
  html = "vscode-html-language-server",
  cssls = "vscode-css-language-server",
}
for ls, cmd in pairs(vs_code_extracted) do
  lspconfig[ls].setup {
    cmd = {cmd, "--stdio"},
    on_attach = on_attach,
    capabilities = capabilities
  }
end

-- local lua_lsp_loc = "/Users/mhartington/Github/lua-language-server"

lspconfig.jsonls.setup {
  cmd = {"vscode-json-language-server", "--stdio"},
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"json", "jsonc"},
  settings = {
    json = {
      -- Schemas https://www.schemastore.org
      schemas = {
        {
          fileMatch = {"package.json"},
          url = "https://json.schemastore.org/package.json"
        },
        {
          fileMatch = {"tsconfig*.json"},
          url = "https://json.schemastore.org/tsconfig.json"
        },
        {
          fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json"
          },
          url = "https://json.schemastore.org/prettierrc.json"
        },
        {
          fileMatch = {".eslintrc", ".eslintrc.json"},
          url = "https://json.schemastore.org/eslintrc.json"
        },
        {
          fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
          url = "https://json.schemastore.org/babelrc.json"
        }
      }
    }
  }
}

return M

-- local custom_attach = function(client)
--   local filetype = vim.api.nvim_buf_get_option(0, "filetype")

--   vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

--   require "lsp_signature".on_attach();

--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

--   local opts = { noremap=true, silent=true }
-- end

-- local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
-- updated_capabilities = require'cmp_nvim_lsp'.update_capabilities(updated_capabilities)

-- local servers = {
--   tsserver = true,
--   yamlls = true,
--   dartls = true,
--   html = true,
--   cssls = true,
--   gopls = {
--     cmd = {'gopls'},
--     settings = {
--       gopls = {
--         analyses = {
--           unusedparams = true,
--           shadow = true,
--         },
--         staticcheck = true,
--         linksInHover = false,
--         codelenses = {
--           generate = true,
--           gc_details = true,
--           regenerate_cgo = true,
--           tidy = true,
--           upgrade_depdendency = true,
--           vendor = true,
--           test = true,
--         },
--         usePlaceholders = true,
--       },
--     },
--   },
-- }

-- local setup_server = function(server, config)
--   if not config then
--     return
--   end

--   if type(config) ~= "table" then
--     config = {}
--   end

--   config = vim.tbl_deep_extend("force", {
--     on_init = custom_init,
--     on_attach = custom_attach,
--     capabilities = updated_capabilities,
--     flags = {
--       debounce_text_changes = 50,
--     },
--   }, config)

--   lspconfig[server].setup(config)
-- end

-- for server, config in pairs(servers) do
--   setup_server(server, config)
-- end
