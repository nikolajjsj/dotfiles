local opts = { noremap = true, silent = true }

-- Remaps
vim.keymap.set("n", "<Leader>n", ":NvimTreeToggle<cr>", opts)  -- NvimTree
vim.keymap.set("n", "<leader><leader>", "<c-^>", opts)
vim.keymap.set("n", "ss", ":split<cr><C-w>w", opts)
vim.keymap.set("n", "sv", ":vsplit<cr><C-w>w", opts)
vim.keymap.set("n", "<Leader>h", "<C-w>h", opts)
vim.keymap.set("n", "<Leader>j", "<C-w>j", opts)
vim.keymap.set("n", "<Leader>k", "<C-w>k", opts)
vim.keymap.set("n", "<Leader>l", "<C-w>l", opts)
vim.keymap.set("n", "<Up>", ":resize -2<cr>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<cr>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize +2<cr>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize -2<cr>", opts)
vim.keymap.set("n", "<Leader>F", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>", opts)
vim.keymap.set("n", "<Leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.keymap.set("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "<Leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)