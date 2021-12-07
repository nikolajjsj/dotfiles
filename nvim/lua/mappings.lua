local map = vim.api.nvim_set_keymap

-- Quickly edit and source neovim config
map('n', '<leader>ve', ':edit ~/code/.dotfiles/nvim/init.lua<cr>', { noremap = true })
map('n', '<leader>vr', ':source ~/code/.dotfiles/nvim/init.lua<cr>', { noremap = true })
-- Quick switch between two last opened buffer
map('n', '<leader><leader>', '<c-^>', { noremap = true})
-- Line navigation
map('n', 'H', '^', {})
map('n', 'L', '$', {})
-- Navigation between windows
map('', '<leader>h', ':wincmd h<CR>', {})
map('', '<leader>j', ':wincmd j<CR>', {})
map('', '<leader>k', ':wincmd k<CR>', {})
map('', '<leader>l', ':wincmd l<CR>', {})
-- Split window
map('n', 'ss', ':split<Return><C-w>w', {})
map('n', 'sv', ':vsplit<Return><C-w>w', {})
-- Open Terminal in split window
map('n', '<Leader>t', ':below 10sp term://$SHELL<CR>i', { noremap = true })
-- Better Visual lines and handling
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
map('v', '<Tab>', '>gv', { noremap = true })
map('v', '<S-Tab>', '<gv', { noremap = true })
map('v', '<', '<gv', {})
map('v', '>', '>gv', {})
