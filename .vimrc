" Theme
set background=dark

" utf encoding
set encoding=UTF-8

" Settings {{{
" Switch syntax highlighting on, when the terminal has colors
syntax on

" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=100

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=2

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=2

" Turn on line numbers
set number

" Highlight tailing whitespace
" See issue: https://github.com/Integralist/ProVim/issues/4
set list listchars=tab:\ \ ,trail:·

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Set built-in file system explorer to use layout similar to the NERDTree plugin
let g:netrw_liststyle=3

" Always highlight column 80 so it's easier to see where
" cutoff appears on longer screens
autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
set colorcolumn=80
" }}}

" Plugins:
call plug#begin()
" Git
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'      " Reveal the last commit message under the cursor      | https://github.com/rhysd/git-messenger.vim

Plug 'mattn/emmet-vim'              " emmet for vim                                        | https://github.com/mattn/emmet-vim
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'dense-analysis/ale'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'eslint/eslint'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Colorschemes
Plug 'icymind/NeoSolarized'             " Solarized colorscheme with better truecolor support   | https://github.com/icymind/NeoSolarized
Plug 'haishanh/night-owl.vim'           " Vim colorscheme based on sdras/night-owl-vscode-theme | https://github.com/haishanh/night-owl.vim
Plug 'kaicataldo/material.vim'          " A port of the Material color scheme for Vim/Neovim    | https://github.com/kaicataldo/material.vim
Plug 'rakr/vim-one'                     " Adaptation of Atom One colorscheme for Vim            | https://github.com/rakr/vim-one
Plug 'bluz71/vim-nightfly-guicolors'    " Another dark color scheme for Vim                     | https://github.com/bluz71/vim-nightfly-guicolors
Plug 'sonph/onehalf', {'rtp': 'vim/'}   " A colorscheme for (Neo)Vim, iTerm, and more.          | https://github.com/sonph/onehalf
Plug 'arcticicestudio/nord-vim'         " Vim colorscheme based on the Nord color palette       | https://github.com/arcticicestudio/nord-vim
Plug 'jacoborus/tender.vim'             " A 24bit colorscheme for Vim, Airline and Lightline    | https://github.com/jacoborus/tender.vim
Plug 'morhetz/gruvbox'                  " Retro groove color scheme for Vim                     | https://github.com/morhetz/gruvbox
Plug 'joshukraine/vim-monokai-tasty',   " My fork of patstockwell/vim-monokai-tasty             | https://github.com/joshukraine/vim-monokai-tasty
call plug#end()

""""" enable 24bit true color

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

""""" enable the theme

syntax enable
colorscheme night-owl

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'nightowl' }

" NERDTree settings
let NERDTreeShowHidden=1

