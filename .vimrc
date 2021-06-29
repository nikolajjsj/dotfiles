set nocompatible " Use vim, not vi api
set noswapfile " No swap file
set history=100 " Command history
set ruler " Always show cursor
set showcmd " Show incomplete commands
set hlsearch " Highlight search matches
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
set mouse=a
filetype on

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
" Git
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'      " Reveal the last commit message under the cursor      | https://github.com/rhysd/git-messenger.vim

Plug 'mattn/emmet-vim'              " emmet for vim                                        | https://github.com/mattn/emmet-vim
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Flutter plugins
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" COC plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Colorschemes
Plug 'icymind/NeoSolarized'             " Solarized colorscheme with better truecolor support   | https://github.com/icymind/NeoSolarized
Plug 'haishanh/night-owl.vim'           " Vim colorscheme based on sdras/night-owl-vscode-theme | https://github.com/haishanh/night-owl.vim
Plug 'kaicataldo/material.vim'          " A port of the Material color scheme for Vim/Neovim    | https://github.com/kaicataldo/material.vim
Plug 'morhetz/gruvbox'                  " Retro groove color scheme for Vim                     | https://github.com/morhetz/gruvbox
call plug#end()
""" End of PLUGINS \""""

" Use Ctrl-k Ctrl-k to open a sidebar with the list of files
map <C-k><C-k> :NERDTreeToggle<cr>
" Use Ctrl-P to open the fuzzy file opener
nnoremap <C-p> :Files<cr>

" Enable the night owl theme and syntax
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme night-owl

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'nightowl' }

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
\ ]

set hidden
