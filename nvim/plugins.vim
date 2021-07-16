"" PLUGINS: """
" Automatic install of vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
" Lualine
Plug 'ryanoasis/vim-devicons'
Plug 'hoob3rt/lualine.nvim'
" Autocompletion
Plug 'nvim-lua/completion-nvim'
" Files finder CTRLP and file explorer (NERDTree)
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" VIM Enchancements
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
" GIT integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Language syntax
Plug 'nvim-treesitter/nvim-treesitter'
" Themes and color schemes
Plug 'haishanh/night-owl.vim'
Plug 'joshdick/onedark.vim'
call plug#end()
""" End of PLUGINS \""""