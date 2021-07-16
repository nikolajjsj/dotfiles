"" PLUGINS: """
" Automatic install of vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
" GIT integration
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Language syntax
Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
" Themes and color schemes
Plug 'haishanh/night-owl.vim'
Plug 'joshdick/onedark.vim'
call plug#end()
""" End of PLUGINS \""""

set nocompatible " Use vim, not vi api
set encoding=UTF-8 nobackup nowritebackup cursorline noswapfile ruler smartcase ignorecase
set shiftwidth=2 autoindent smartindent tabstop=2 softtabstop=2 expandtab
set visualbell showmatch noshowmode relativenumber linebreak lazyredraw
set splitbelow splitright scrolloff=20 backspace=indent,eol,start signcolumn=yes
set updatetime=300 hidden wildmenu wildmode=longest:full,full
let mapleader = " "

filetype on

" Navigation between windows
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" open terminal
nnoremap <leader>t :below 10sp term://$SHELL<cr>i
" hit <Escape> key to exit from terminal mode
:tnoremap <Esc> <C-\><C-n>
nnoremap <C-f> :CtrlP<CR>
nnoremap Q <nop>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap K :move-2<CR>==
nnoremap J :move+<CR>==
vnoremap <Tab> >
vnoremap <S-Tab> <
vmap < <gv
vmap > >gv

colorscheme onedark
set background=dark
set termguicolors

hi! Normal ctermbg=NONE guibg=NONE
hi! Nontext ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" NERDTree configs
map <C-n><C-n> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
nmap ++ <plug>NERDCommenterToggle

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'onedark' }

" COC config
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-vetur']

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocIfNoDiagnostic(timer_id)
  if (CocHasProvider('hover'))
    call CocAction('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

