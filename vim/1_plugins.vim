call plug#begin('~/.vim/plugged')
    " Python venv Support
    Plug 'petobens/poet-v'

    " UI
    Plug 'itchyny/lightline.vim'
    Plug 'flazz/vim-colorschemes'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'Yggdroot/indentLine'
    " System 
    Plug 'roxma/nvim-yarp' " tbh i have no idea why i have this, but i assume it's useful?
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'


    """ based off https://github.com/VonHeikemen/lsp-zero.nvim
    " LSP Support
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'

    " Autocompletion
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'

    "  Snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'

    Plug 'VonHeikemen/lsp-zero.nvim'

    " Provides a nicer list of errors
    Plug 'folke/trouble.nvim'
call plug#end()
