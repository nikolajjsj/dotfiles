set nocompatible " Use vim, not vi api
set encoding=UTF-8 nobackup nowritebackup cursorline noswapfile ruler smartcase ignorecase
set shiftwidth=2 autoindent smartindent tabstop=2 softtabstop=2 expandtab
set visualbell showmatch noshowmode number relativenumber linebreak lazyredraw
set splitbelow splitright scrolloff=20 backspace=indent,eol,start signcolumn=yes
set updatetime=300 hidden wildmenu wildmode=longest:full,full
set completeopt=menu,menuone,noinsert,noselect clipboard=unnamedplus

" Setting leader key to space
let mapleader=" "

" Sourcing plugins and mappin
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/maps.vim

filetype on
colorscheme onedark
set background=dark
set termguicolors

hi! Normal ctermbg=NONE guibg=NONE
hi! Nontext ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

lua << EOF
require('lsp')
require('treesitter')
require('completion')
require('statusbar')
EOF

