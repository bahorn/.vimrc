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
