local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_next()<CR>', { noremap = true, silent = true })

