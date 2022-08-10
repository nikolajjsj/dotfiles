local nnoremap = require("nikolajjsj.remap").nnoremap

-- Remaps
nnoremap("<leader>t", ":sp<cr> :term<CR> :resize 20N<cr> i")

-- Tabs
nnoremap('te', ':tabedit<cr>')
nnoremap('<S-Tab>', ':tabprev<cr>')
nnoremap('<Tab>', ':tabnext<cr>')

-- Quick switch between two last opened buffer
nnoremap('<leader><leader>', '<c-^>')

-- Split window
nnoremap('ss', ':split<cr><C-w>w')
nnoremap('sv', ':vsplit<cr><C-w>w')
-- Navigation between windows
nnoremap('<Leader>h', '<C-w>h')
nnoremap('<Leader>j', '<C-w>j')
nnoremap('<Leader>k', '<C-w>k')
nnoremap('<Leader>l', '<C-w>l')
-- Resize with arrows
nnoremap('<Up>', ':resize -2<cr>')
nnoremap('<Down>', ':resize +2<cr>')
nnoremap('<Left>', ':vertical resize +2<cr>')
nnoremap('<Right>', ':vertical resize -2<cr>')

-- Awesome stuff
nnoremap('<Leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
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
