local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier_d_slim.with({
      filetypes = { "html", "json", "yaml", "markdown" },
  }),
  formatting.dart_format,
  formatting.stylua,
  diagnostics.eslint_d,
}

null_ls.setup({
	debug = false,
	sources = sources,
})
