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
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap <Tab> >
vnoremap <S-Tab> <
vmap < <gv
vmap > >gv

" VIM fugitive - git
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

