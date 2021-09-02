scriptencoding utf-8
syntax enable
set cmdheight=1 " Give more space for displaying messages
set colorcolumn=80
set signcolumn=yes
set relativenumber nu
set shiftwidth=2 tabstop=2 softtabstop=2
set expandtab smartindent smarttab ai si
set scrolloff=20 nowrap
set wildmenu wildmode=longest:full,full
set completeopt=menu,menuone,noinsert,noselect
set lazyredraw ignorecase
set backspace=start,eol,indent
set formatoptions+=r 
set cursorline mouse=a
set noswapfile nobackup

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
require('gitsigns').setup()
EOF
