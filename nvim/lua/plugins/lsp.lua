local lspconfig = require'lspconfig'
local protocol = require'vim.lsp.protocol'

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

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

  -- Autoformatting
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[
      augroup Format
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
      augroup END
    ]]
  end
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = require'cmp_nvim_lsp'.update_capabilities(updated_capabilities)

local servers = {
  tsserver = true,
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
