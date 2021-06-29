set nocompatible " Use vim, not vi api
set linebreak           " Have lines wrap instead of continue off-screen
set scrolloff=12        " Keep cursor in approximately the middle of the screen
set noswapfile " No swap file
set history=100 " Command history
set ruler " Always show cursor
set showcmd " Show incomplete commands
set smartcase " Ignore case in search
set ignorecase " Make sure any searches /searchPhrase doesn't need the \c escape character
set nowrap " Turn word wrap off
set backspace=indent,eol,start " Allow backspace to delete end of line, indent and start of line characters
set expandtab " Convert tabs to spaces
set tabstop=2 " Set tab size in spaces (this is for manual indenting)
set shiftwidth=2 " The number of spaces inserted for a tab (used for auto indenting)
set number " Turn on line numbers
set list listchars=tab:\ \ ,trail:· " Highlight tailing whitespace
set laststatus=2 " Always show status bar
" set statusline=%f\ %=L:%l/%L\ %c\ (%p%%) " Set the status line to something useful
set splitbelow " Better splits (new windows appear below and to the right)
set splitright " Better splits (new windows appear below and to the right)
set cursorline " Highlight the current line
set visualbell " Ensure Vim doesn't beep at you every time you make a mistype
set wildmenu " Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set lazyredraw " redraw only when we need to (i.e. don't redraw when executing a macro)
set showmatch " highlight a matching [{()}] when cursor is placed on start/end character
set relativenumber " show relative line numbers
set mouse+=a
set noshowmode
filetype on
" Jump to start and end of line using the home row keys
map H ^
map L $
" (Shift)Tab (de)indents code
vnoremap <Tab> >
vnoremap <S-Tab> <
" Capital JK move code lines/blocks up & down
" TODO improve functionality
nnoremap K :move-2<CR>==
nnoremap J :move+<CR>==

" Keep VisualMode after indent with > or <
vmap < <gv
vmap > >gv
"
" Move Visual blocks with J an K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

""" PLUGINS: """
" Automatic install of vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
"Search
Plug 'romainl/vim-cool'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Text manipulation
Plug 'tpope/vim-sensible'             " Some better defaults
Plug 'preservim/nerdcommenter'
" GUI enchancements
Plug 'itchyny/lightline.vim'          " Better Status Bar
Plug 'mhinz/vim-startify'             " Better start screen
Plug 'preservim/nerdtree'             " File explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'itchyny/lightline.vim'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'        " Reveal the last commit message under the cursor
Plug 'Xuyuanp/nerdtree-git-plugin'
" Miscelaneous
Plug 'mattn/emmet-vim'                " emmet for vim
Plug 'sheerun/vim-polyglot'           " syntax highligting
" Language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-css-color'                " CSS colors
Plug 'frazrepo/vim-rainbow'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
" Colorschemes
Plug 'icymind/NeoSolarized'
Plug 'altercation/solarized'
Plug 'haishanh/night-owl.vim'
call plug#end()
""" End of PLUGINS \""""

" Use Ctrl-k Ctrl-k to open a sidebar with the list of files
map <C-n><C-n> :NERDTreeToggle<cr>
" Use Ctrl-P to open the fuzzy file opener
nnoremap <C-p> :Files<cr>
" Show hidden files in NERDTree
let NERDTreeShowHidden=1

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

if (has("termguicolors"))
  set termguicolors
  colorscheme night-owl 
endif

syntax enable

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'night-owl' }

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
  \'coc-git',
  \'coc-highlight',
\ ]

set hidden
