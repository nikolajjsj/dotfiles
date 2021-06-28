set encoding=UTF-8 " utf encoding
syntax on " Switch syntax highlighting on, when the terminal has colors
set nocompatible " Use vim, not vi api
set nobackup " No backup files
set nowritebackup " No write backup
set noswapfile " No swap file
set history=100 " Command history
set ruler " Always show cursor
set showcmd " Show incomplete commands
set incsearch " Incremental searching (search as you type)
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
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%) " Set the status line to something useful
set splitbelow " Better splits (new windows appear below and to the right)
set splitright " Better splits (new windows appear below and to the right)
set cursorline " Highlight the current line
set visualbell " Ensure Vim doesn't beep at you every time you make a mistype
set wildmenu " Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set lazyredraw " redraw only when we need to (i.e. don't redraw when executing a macro)
set showmatch " highlight a matching [{()}] when cursor is placed on start/end character

" remaps
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O

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
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'eslint/eslint'

" COC plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" Enable the night owl theme and syntax
syntax enable
colorscheme night-owl

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'nightowl' }

" NERDTree settings
let NERDTreeShowHidden=1

" coc config
let g:coc_global_extensions = [
  \	'coc-snippets',
  \	'coc-pairs',
  \	'coc-tsserver',
  \	'coc-eslint',
  \	'coc-prettier',
  \	'coc-json',
\ ]
set hidden
