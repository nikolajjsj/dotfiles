"" PLUGINS: """
" Automatic install of vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'hrsh7th/nvim-compe'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'norcalli/nvim-colorizer.lua'
endif

call plug#end()
""" End of PLUGINS \""""
