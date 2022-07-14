" UI Related settings

if has('mouse')
    set mouse=a
endif

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Highlight Long Lines
set colorcolumn=81
" Auto limit line length
set tw=80


let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
            
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

map <C-n> :NvimTreeToggle<CR>

augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END


lua <<EOF
    require("nvim-tree").setup()
    
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {'branch', icon = ''},
            'diff',
            'diagnostics'
        },
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'filetype'},
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
