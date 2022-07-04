local opts = { noremap = true, silent = true}
local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Remaps
map("n", "<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)
map('n', '<C-N>', ":Lexplore<CR> :vertical resize 30<CR>", opts)
map('n', 'te', ':tabedit', opts)
map('n', '<S-Tab>', ':tabprev<Return>', opts)
map('n', '<Tab>', ':tabnext<Return>', opts)
-- Quick switch between two last opened buffer
map('n', '<leader><leader>', '<c-^>', opts)
-- Toggle explore to the left
map('n', '<leader>e', ':Lex 30<cr>', opts)
-- Navigation between windows
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
-- Resize with arrows
map('n', '<Up>', ':resize -2<cr>', opts)
map('n', '<Down>', ':resize +2<cr>', opts)
map('n', '<Left>', ':vertical resize +2<cr>', opts)
map('n', '<Right>', ':vertical resize -2<cr>', opts)
-- Split window
map('n', 'ss', ':split<Return><C-w>w', opts)
-- Awesome stuff
map('n', '<Leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', opts)
map('n', '<Leader>F', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>', opts)
map('n', '<Leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<Leader>K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- map("n", "<leader>ff", function() require('telescope.builtin').find_files() end, opts)
-- map("n", "<leader>F", function() vim.lsp.buf.formatting_seq_sync() end, opts)
-- map("n", "<leader>gD", function() vim.lsp.buf.declaration() end, opts)
-- map("n", "<leader>D", function() vim.diagnostic.open_float() end, opts)
-- map("n", "<leader>K", function() vim.lsp.buf.hover() end, opts)
-- map("n", "<leader>gi", function() vim.lsp.buf.implementation() end,opts)
-- map("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
-- map("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
-- map("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
-- map("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
-- map("n", "]d", function() vim.diagnostic.goto_next() end, opts)
