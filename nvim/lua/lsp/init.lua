local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  return
end

local lspconfig_util = require "lspconfig.util"
local nvim_status = require "lsp-status"
local status = require "lsp.status"
local cmp_nvim_lsp = require'cmp_nvim_lsp'

status.activate()

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local filetype_attach = setmetatable({
  go = function(client)
    vim.cmd [[
      augroup lsp_buf_format
        au! BufWritePre <buffer>
        autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
      augroup END
    ]]
  end,
  dart = function(client)
    require'lsp.flutter_lsp'
  end
}, {
  __index = function()
    return function() end
  end,
})

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")
  nvim_status.on_attach(client)

  require "lsp_signature".on_attach();

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<Leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap("n", "<Leader>fc", '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  if client.resolved_capabilities.code_lens then
    vim.cmd [[
      augroup lsp_document_codelens
        au! * <buffer>
        autocmd BufWritePost,CursorHold <buffer> lua vim.lsp.codelens.refresh()
      augroup END
    ]]
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd [[
      augroup Format
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
      augroup END
    ]]
  end

  -- Attach any filetype specific options to the client
  filetype_attach[filetype](client)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = vim.tbl_deep_extend("keep", updated_capabilities, nvim_status.capabilities)
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }
updated_capabilities = cmp_nvim_lsp.update_capabilities(updated_capabilities)

local servers = {
  graphql = true,
  pyright = true,
  vimls = true,
  yamlls = true,
  dartls = true,
  html = true,
  cssls = true,
  gopls = {
    cmd = {'gopls'},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
        linksInHover = false,
        codelenses = {
          generate = true,
          gc_details = true,
          regenerate_cgo = true,
          tidy = true,
          upgrade_depdendency = true,
          vendor = true,
          test = true,
        },
        usePlaceholders = true,
      },
    },
  },
  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  },
  diagnosticls = {
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json', 'css', 'less', 'scss', 'markdown', 'html', 'vue' },
    init_options = {
      filetypes = {
        javascript = 'eslint',
        javascriptreact = 'eslint',
        typescript = 'eslint',
        typescriptreact = 'eslint',
        vue = 'eslint',
      },
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
      formatters = {
        eslint_d = {
          command = 'eslint_d',
          args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
          rootPatterns = { '.git' },
        },
        prettier = {
          command = 'prettier',
          args = { '--stdin-filepath', '%filename' }
        }
      },
      formatFiletypes = {
        javascript = 'eslint_d',
        javascriptreact = 'eslint_d',
        typescript = 'eslint_d',
        typescriptreact = 'eslint_d',
        vue = 'eslint_d',
        html = 'prettier',
        css = 'prettier',
        less = 'prettier',
        scss = 'prettier',
        json = 'prettier',
        markdown = 'prettier',
      }
    }
  }
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = 50,
    },
  }, config)

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

return {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}
