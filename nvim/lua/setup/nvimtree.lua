require'nvim-tree'.setup {
  disable_netrw = false,
}

local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
