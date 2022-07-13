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
