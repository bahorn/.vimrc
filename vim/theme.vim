" Theme settings

colorscheme material
let g:material_style = "deep ocean"
set background=dark

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

