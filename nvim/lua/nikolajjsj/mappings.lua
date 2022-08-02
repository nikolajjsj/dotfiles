local nnoremap = require("nikolajjsj.remap").nnoremap

-- Remaps
nnoremap("<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i")
nnoremap("<Esc>", "<C-\\><C-n>")
nnoremap('<C-N>', ":Lexplore<CR> :vertical resize 30<CR>")
nnoremap('te', ':tabedit')
nnoremap('<S-Tab>', ':tabprev<Return>')
nnoremap('<Tab>', ':tabnext<Return>')
-- Quick switch between two last opened buffer
nnoremap('<leader><leader>', '<c-^>')
-- Toggle explore to the left
nnoremap('<leader>e', ':Lex 30<cr>')
-- Navigation between windows
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')
-- Resize with arrows
nnoremap('<Up>', ':resize -2<cr>')
nnoremap('<Down>', ':resize +2<cr>')
nnoremap('<Left>', ':vertical resize +2<cr>')
nnoremap('<Right>', ':vertical resize -2<cr>')
-- Split window
nnoremap('ss', ':split<Return><C-w>w')
-- Awesome stuff
nnoremap('<Leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
nnoremap('<Leader>p', '<cmd>Ex<CR>')
nnoremap('<Leader>F', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>')
nnoremap('<Leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nnoremap('<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nnoremap('<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
nnoremap('<Leader>K', '<cmd>lua vim.lsp.buf.hover()<CR>')
nnoremap('<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
nnoremap('<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
nnoremap('<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
nnoremap('<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
nnoremap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
nnoremap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
-- folke/trouble
nnoremap('<Leader>xx', '<cmd>TroubleToggle<CR>')
nnoremap('<Leader>xq', '<cmd>TroubleToggle quickfix<CR>')
