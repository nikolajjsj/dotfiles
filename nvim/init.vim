source ~/.config/nvim/plugins.vim
source ~/.config/nvim/maps.vim

set nocompatible " Use vim, not vi api
set encoding=UTF-8 nobackup nowritebackup cursorline noswapfile ruler smartcase ignorecase
set shiftwidth=2 autoindent smartindent tabstop=2 softtabstop=2 expandtab
set visualbell showmatch noshowmode relativenumber linebreak lazyredraw
set splitbelow splitright scrolloff=20 backspace=indent,eol,start signcolumn=yes
set updatetime=300 hidden wildmenu wildmode=longest:full,full
set completeopt=menu,menuone,noinsert,noselect
filetype on
colorscheme onedark
set background=dark
set termguicolors
hi! Normal ctermbg=NONE guibg=NONE
hi! Nontext ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

let mapleader = " "
let NERDTreeShowHidden=1
let g:lightline = { 'colorscheme': 'onedark' } " To enable the lightline theme

" Completion-nvim setup
autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

""" LSP configuration
lua << EOF
require'lspinstall'.setup() -- important
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- Treesitter setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained"
  indent = {
    enable = true
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}

-- Lualine setup
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

