set runtimepath^=~/.vim runtimepath+=~/.vim/after
let g:loaded_perl_provider = 0

let &packpath = &runtimepath
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
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
" general
set backup
set history=50
set ruler
set showcmd
set incsearch
set number
set guicursor=
" manage tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" spelling
set spell spelllang=en
" terminal settings
set encoding=utf-8
set fileencoding=utf-8
set t_Co=256
" set term=xterm-256color
set termencoding=utf-8

let g:python_host_prog  = '/usr/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'

set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

" keybinding

set backspace=indent,eol,start

command W w
command Q q
command WQ wq
map <C-a> :!make
map <F7> mzgg=G`z
map Q gq
inoremap <C-U> <C-G>u<C-U>

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" language server setup
lua <<EOF
    local lsp = require('lsp-zero')

    lsp.set_preferences({
      suggest_lsp_servers = true,
      setup_servers_on_start = true,
      set_lsp_keymaps = true,
      configure_diagnostics = true,
      cmp_capabilities = true,
      manage_nvim_cmp = true,
      call_servers = 'local',
      sign_icons = {
        error = 'X',
        warn = '!',
        hint = '#',
        info = 'i'
      }
    })

    lsp.setup()


    require("trouble").setup {
        icons = false,
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
            -- icons / text used for a diagnostic
            error = "error",
            warning = "warn",
            hint = "hint",
            information = "info"
        },
        use_diagnostic_signs = true,
        auto_open = true,
        auto_close = true
    }
EOF
colorscheme iceberg
set background=dark

let g:lightline = {
    \   'colorscheme': 'seoul256',
    \   'active': {
    \       'left': [
    \           [ 'mode', 'paste' ],
    \           [ 'readonly', 'filename', 'modified' ],
    \           [ 'gitbranch' ]
    \       ],
    \   },
    \   'component_function': {
    \       'gitbranch': 'FugitiveHead'
    \   },
    \ }

set laststatus=2

call rainbow_parentheses#activate()
if &l:background == 'dark'
  hi! RainbowLevel0 ctermfg=142 guifg=#b8bb26
  hi! RainbowLevel1 ctermfg=108 guifg=#8ec07c
  hi! RainbowLevel2 ctermfg=109 guifg=#83a598
  hi! RainbowLevel3 ctermfg=175 guifg=#d3869b
  hi! RainbowLevel4 ctermfg=167 guifg=#fb4934
  hi! RainbowLevel5 ctermfg=208 guifg=#fe8019
  hi! RainbowLevel6 ctermfg=214 guifg=#fabd2f
  hi! RainbowLevel7 ctermfg=223 guifg=#ebdbb2
  hi! RainbowLevel8 ctermfg=245 guifg=#928374
else
  hi! RainbowLevel0 ctermfg=100 guifg=#79740e
  hi! RainbowLevel1 ctermfg=066 guifg=#427b58
  hi! RainbowLevel2 ctermfg=024 guifg=#076678
  hi! RainbowLevel3 ctermfg=096 guifg=#8f3f71
  hi! RainbowLevel4 ctermfg=088 guifg=#9d0006
  hi! RainbowLevel5 ctermfg=130 guifg=#af3a03
  hi! RainbowLevel6 ctermfg=136 guifg=#b57614
  hi! RainbowLevel7 ctermfg=244 guifg=#928374
  hi! RainbowLevel8 ctermfg=237 guifg=#3c3836
endif

if has('mouse')
    set mouse=a
endif

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Highlight Long Lines
set colorcolumn=81
hi clear SpellBad
hi clear SpellCap
hi SpellBad cterm=underline
hi SpellCap cterm=bold
" Auto limit line length
set tw=80


let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
            
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1


let g:indentLine_setConceal = 1
let g:indentLine_conceallevel = 0
let g:indentLine_char = '|'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_leadingSpaceChar = ' '
let g:indentLine_leadingSpaceEnabled = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END
