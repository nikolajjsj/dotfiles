local api = vim.api

-- Quick switch between two last opened buffer
api.nvim_set_keymap('n', '<leader><leader>', '<c-^>', { noremap = true})
-- Line navigation
api.nvim_set_keymap('n', 'H', '^', {})
api.nvim_set_keymap('n', 'L', '$', {})
-- Navigation between windows
api.nvim_set_keymap('', '<leader>h', ':wincmd h<CR>', {})
api.nvim_set_keymap('', '<leader>j', ':wincmd j<CR>', {})
api.nvim_set_keymap('', '<leader>k', ':wincmd k<CR>', {})
api.nvim_set_keymap('', '<leader>l', ':wincmd l<CR>', {})
-- Split window
api.nvim_set_keymap('n', 'ss', ':split<Return><C-w>w', {})
api.nvim_set_keymap('n', 'sv', ':vsplit<Return><C-w>w', {})
-- Open Terminal in split window
api.nvim_set_keymap('n', '<Leader>t', ':below 10sp term://$SHELL<CR>i', { noremap = true })
-- Resize windows
api.nvim_set_keymap('n', '<Up>', ':resize +2<CR>', { noremap = true })
api.nvim_set_keymap('n', '<Down>', ':resize -2<CR>', { noremap = true })
api.nvim_set_keymap('n', '<Left>', ':vertical resize +2<CR>', { noremap = true })
api.nvim_set_keymap('n', '<Right>', ':vertical resize -2<CR>', { noremap = true })
-- Move "visual" lines up and down
api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
-- Indent "visual" lines
api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true })
api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true })
api.nvim_set_keymap('v', '<', '<gv', {})
api.nvim_set_keymap('v', '>', '>gv', {})
-- Vim fugitive key mappings
api.nvim_set_keymap('n', '<Leader>gs', ':G<CR>', {})
-- Open lazy git in split
api.nvim_set_keymap('n', '<Leader>lg', ':below 30sp term://$SHELL<CR>i lazygit && exit<CR>', { noremap = true })


