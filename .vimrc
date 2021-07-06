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
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
" Colorschemes
Plug 'haishanh/night-owl.vim'
Plug 'joshdick/onedark.vim'
call plug#end()
""" End of PLUGINS \""""

set nocompatible " Use vim, not vi api
set shiftwidth=2 autoindent smartindent tabstop=2 softtabstop=2 expandtab
set encoding=UTF-8 nobackup nowritebackup cursorline noswapfile ruler smartcase ignorecase
set visualbell showmatch noshowmode relativenumber linebreak lazyredraw wildmode=longest,list,full
set splitbelow splitright scrolloff=20 backspace=indent,eol,start signcolumn=yes

filetype on

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

map <C-n><C-n> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
nmap ++ <plug>NERDCommenterToggle
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'onedark' }

" coc config
let g:coc_global_extensions = [
  \ 'coc-flutter',
  \	'coc-tsserver',
  \	'coc-json',
  \ 'coc-python',
  \ 'coc-html',
  \ 'coc-css',
	\ 'coc-diagnostic',
  \	'coc-prettier',
  \	'coc-eslint',
  \	'coc-snippets',
  \	'coc-pairs',
  \ 'coc-git',
  \ 'coc-highlight',
\ ]

set hidden
