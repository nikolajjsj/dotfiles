local map = vim.api.nvim_set_keymap

local opts = { noremap = true }

-- Quickly edit and source neovim config
map('n', '<leader>ve', ':edit ~/code/.dotfiles/nvim/init.lua<cr>', opts)
map('n', '<leader>vr', ':source ~/code/.dotfiles/nvim/init.lua<cr>', opts)
-- Quick switch between two last opened buffer
map('n', '<leader><leader>', '<c-^>', opts)
-- Line navigation
map('n', 'H', '^', opts)
map('n', 'L', '$', opts)
-- Navigation between windows
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
-- Split window
map('n', 'ss', ':split<Return><C-w>w', opts)
map('n', 'sv', ':vsplit<Return><C-w>w', opts)
-- Open Terminal in split window
map('n', '<Leader>t', ':below 10sp term://$SHELL<CR>i', opts)
-- Better Visual lines and handling
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map('v', '<Tab>', '>gv', opts)
map('v', '<S-Tab>', '<gv', opts)
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
