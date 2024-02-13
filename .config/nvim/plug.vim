if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  " Plug 'kristijanhusak/defx-git'
  " Plug 'kristijanhusak/defx-icons'
  " Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'tami5/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'L3MON4D3/LuaSnip'
  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  " Plug "williamboman/mason.nvim"
  " Plug "williamboman/mason-lspconfig.nvim"
  Plug 'ray-x/lsp_signature.nvim'
  " auto complete
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'onsails/lspkind-nvim'
  Plug 'ray-x/cmp-treesitter'
  Plug 'ivechan/gtags.vim'


  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'tom-anders/telescope-vim-bookmarks.nvim'
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'octol/vim-cpp-enhanced-highlight'

  Plug 'bluz71/vim-moonfly-colors'
  Plug 'preservim/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'jdonaldson/vaxe'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/vim-easy-align'
  Plug 'rhysd/clever-f.vim'
  Plug 'kana/vim-operator-user'
  Plug 'haya14busa/vim-operator-flashy'
  Plug 'kana/vim-operator-replace'
  Plug 'rhysd/vim-operator-surround'
  Plug 'kana/vim-textobj-user'
  Plug 'osyo-manga/vim-textobj-multiblock'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'terryma/vim-expand-region'
  Plug 'Yggdroot/indentLine'
  Plug 'RRethy/vim-illuminate'


  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
endif

Plug 'groenewege/vim-less', { 'for': 'less' }
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()

