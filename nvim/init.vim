scriptencoding utf-8
syntax enable
set nocompatible relativenumber nu encoding=utf-8 title
set nobackup hlsearch showcmd laststatus=2 cmdheight=1 expandtab
set splitbelow splitright scrolloff=20 nowrap
set signcolumn=yes wildmenu wildmode=longest:full,full
set completeopt=menu,menuone,noinsert,noselect
set lazyredraw ignorecase smarttab
set backupskip=/tmp/*,/private/tmp/*
set shiftwidth=2 tabstop=2 backspace=start,eol,indent
set ai si " auto indent, smart indent
set path+=** " Finding files -Search down subfolders
set wildignore+=*/node_modules/*
set formatoptions+=r 
set cursorline mouse=a

"""" File types """"
au BufNewFile,BufRead *.es6 setf javascript " JavaScript
au BufNewFile,BufRead *.tsx setf typescriptreact " TypeScript
au BufNewFile,BufRead *.md set filetype=markdown " Markdown
set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

filetype plugin indent on

"""" Stuff that depends on OS """"
if has("unix")
  let s:uname = system("uname -s")
  " MacOS
  if s:uname == "Darwin\n"
    set clipboard+=unnamedplus
  endif
endif

" Setting leader key to space
let mapleader=" "

" Sourcing plugins and mappin
source ~/.config/nvim/maps.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/theme.vim

lua << EOF
require('lsp')
require('treesitter')
require('completion')
require('statusbar')
require('commenter')
require('autopair')
require('telescopes')
require('buffer')
require('lsp-color')
require('saga')
EOF
