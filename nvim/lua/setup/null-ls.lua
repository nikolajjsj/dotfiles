local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier_d_slim.with({ extra_args = { "--stdin", "--stdin-filepath", "%filename" } }),
		formatting.stylua,
		diagnostics.eslint_d.with({ extra_args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" } }),
	},
})
