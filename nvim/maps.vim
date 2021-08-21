" Description: Keymaps

" Navigation between windows
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w


nnoremap <leader>t :below 10sp term://$SHELL<cr>i
:tnoremap <Esc> <C-\><C-n> # <Escape> to exit terminal
nnoremap <C-f> :CtrlP<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
vnoremap <Tab> >
vnoremap <S-Tab> <
vmap < <gv
vmap > >gv

if exists('g:loaded_telescope')
  " Telescope
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif

if exists('g:loaded_lspsaga')
  nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
  nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
  inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
  nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
endif
