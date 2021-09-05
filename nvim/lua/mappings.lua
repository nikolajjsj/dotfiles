-- Quick switch between two last opened buffer
vim.api.nvim_set_keymap('n', '<leader><leader>', '<c-^>', { noremap = true})
-- Navigation between windows
vim.api.nvim_set_keymap('', '<leader>h', ':wincmd h<CR>', {})
vim.api.nvim_set_keymap('', '<leader>j', ':wincmd j<CR>', {})
vim.api.nvim_set_keymap('', '<leader>k', ':wincmd k<CR>', {})
vim.api.nvim_set_keymap('', '<leader>l', ':wincmd l<CR>', {})
-- Split window
vim.api.nvim_set_keymap('n', 'ss', ':split<Return><C-w>w', {})
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<Return><C-w>w', {})
-- Open Terminal in split window
vim.api.nvim_set_keymap('n', '<Leader>t', ':below 10sp term://$SHELL<CR>i', { noremap = true })
-- Resize windows
vim.api.nvim_set_keymap('n', '<Up>', ':resize +2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', ':resize -2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', ':vertical resize +2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', ':vertical resize -2<CR>', { noremap = true })
-- Move "visual" lines up and down
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-1<CR>gv=gv", { noremap = true })
-- Indent "visual" lines
vim.api.nvim_set_keymap('v', '<Tab>', '>', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-Tab>', '<', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', {})
vim.api.nvim_set_keymap('v', '>', '>gv', {})
-- Vim fugitive key mappings
vim.api.nvim_set_keymap('n', '<Leader>gs', ':G<CR>', {})

