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
set spelllang=en
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

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

nnoremap <silent> <F9> :set spell!<cr>
inoremap <silent> <F9> <C-O>:set spell!<cr>

lua <<EOF
    -- require('spellsitter').setup()
EOF

" telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
