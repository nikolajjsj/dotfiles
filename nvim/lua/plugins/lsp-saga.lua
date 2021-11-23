local saga = require 'lspsaga'

saga.init_lsp_saga {
  code_action_icon = '💡',
  code_action_prompt = {
    enable        = true,
    sign          = true,
    sign_priority = 15,
    virtual_text  = false,
  },
  code_action_keys = { quit = {'q', '<ESC>'}, exec = '<CR>' },
  border_style     = "round",
}

local set = vim.api.nvim_set_keymap

set('n', '<C-k>', '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_prev()<CR>', { noremap = true, silent = true })
set('n', '<C-j>', '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_next()<CR>', { noremap = true, silent = true })
