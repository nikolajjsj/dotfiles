""" PLUGINS: """
" Automatic install of vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
"Search
Plug 'romainl/vim-cool'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Text manipulation
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdcommenter'
" GUI enchancements
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
" Language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-css-color'
Plug 'frazrepo/vim-rainbow'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'sheerun/vim-polyglot'
" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'haishanh/night-owl.vim'
call plug#end()
""" End of PLUGINS \""""

set nocompatible " Use vim, not vi api
set encoding=UTF-8 nobackup nowritebackup cursorline noswapfile ruler smartcase ignorecase
set visualbell wildmenu showmatch noshowmode relativenumber expandtab linebreak lazyredraw
set splitbelow splitright
set scrolloff=12        " Keep cursor in approximately the middle of the screen
set history=100 " Command history
set backspace=indent,eol,start " Allow backspace to delete end of line, indent and start of line characters
set tabstop=2 " Set tab size in spaces (this is for manual indenting)
set shiftwidth=2 " The number of spaces inserted for a tab (used for auto indenting)
set list listchars=tab:\ \ ,trail:· " Highlight tailing whitespace
set laststatus=2 " Always show status bar
set mouse+=a

filetype on

" (Shift)Tab (de)indents code
vnoremap <Tab> >
vnoremap <S-Tab> <
nnoremap K :move-2<CR>==
nnoremap J :move+<CR>==
nnoremap Q <nop>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Keep VisualMode after indent with > or <
vmap < <gv
vmap > >gv
" Move Visual blocks with J an K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

colorscheme gruvbox
set background=dark
set termguicolors

hi! Normal ctermbg=NONE guibg=NONE
hi! Nontext ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" Use Ctrl-k Ctrl-k to open a sidebar with the list of files
map <C-n><C-n> :NERDTreeToggle<cr>
" Use Ctrl-P to open the fuzzy file opener
nnoremap <C-p> :Files<cr>
" Show hidden files in NERDTree
let NERDTreeShowHidden=1

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

""" CoC
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'gruvbox' }

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
