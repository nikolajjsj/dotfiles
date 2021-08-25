" init autocmd
autocmd!
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

syntax enable
set nocompatible relativenumber encoding=utf-8 title
set nobackup hlsearch showcmd laststatus=2 cmdheight=1 expandtab
set splitbelow splitright scrolloff=20
set signcolumn=yes wildmenu wildmode=longest:full,full
set completeopt=menu,menuone,noinsert,noselect
set lazyredraw ignorecase smarttab
set backupskip=/tmp/*,/private/tmp/*
set shiftwidth=2 tabstop=2 backspace=start,eol,indent
set ai si " auto indent, smart indent
set path+=** " Finding files -Search down subfolders
set wildignore+=*/node_modules/*
" Add asterisks in block comments
set formatoptions+=r
set cursorline mouse=a

"""" Highlighting """"
" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"""" File types """"
au BufNewFile,BufRead *.es6 setf javascript " JavaScript
au BufNewFile,BufRead *.tsx setf typescriptreact " TypeScript
au BufNewFile,BufRead *.md set filetype=markdown " Markdown
set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

filetype plugin indent on

"""" Theming """"
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors winblend=0 wildoptions=pum pumblend=5
  set background=dark
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
endif

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
