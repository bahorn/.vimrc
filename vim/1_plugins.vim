call plug#begin('~/.vim/plugged')
    " Python venv Support
    Plug 'petobens/poet-v'

    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

    " UI
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'marko-cerovac/material.nvim'
    Plug 'junegunn/rainbow_parentheses.vim'
    " System 
    Plug 'roxma/nvim-yarp' " tbh i have no idea why i have this, but i assume it's useful?
    Plug 'kyazdani42/nvim-tree.lua'

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

    " Treesitter Support
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'lewis6991/spellsitter.nvim'

    " Justfile
    Plug 'NoahTheDuke/vim-just'
call plug#end()
