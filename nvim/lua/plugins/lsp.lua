local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Add lsp_signature on attach
  require "lsp_signature".on_attach();

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<Leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<Leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>k', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap("n", "<Leader>fc", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[ augroup Format ]]
    vim.api.nvim_command [[ autocmd! * <buffer> ]]
    vim.api.nvim_command [[ autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync() ]]
    vim.api.nvim_command [[ augroup END ]]
  end
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
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
      vue = 'eslint_d',
      css = 'prettier',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      json = 'prettier',
      markdown = 'prettier',
      html = 'prettier',
    }
  }
}
-- npm i -g vscode-css-languageserver-bin
nvim_lsp.cssls.setup { on_attach = on_attach }
-- npm i -g dartls
nvim_lsp.dartls.setup { on_attach = on_attach }
-- npm i -g pyright
nvim_lsp.pyright.setup { on_attach = on_attach }
-- npm i -g vuels
nvim_lsp.vuels.setup { on_attach = on_attach }
-- npm i -g vscode-css-languageserver-bin
nvim_lsp.html.setup { on_attach = on_attach }
-- npm install -g typescript typescript-language-server
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
}

