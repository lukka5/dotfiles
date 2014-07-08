set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="valloric"

"
" Gvim colors
"
hi Boolean         guifg=#ffff00
hi Character       guifg=#E6DB74
hi Number          guifg=#ffff00
hi String          guifg=#E6DB74
hi Conditional     guifg=#3664FF               gui=none
hi Constant        guifg=#ffff00
hi Cursor          guifg=#000000 guibg=#F8F8F0
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#66D9EF
hi Delimiter       guifg=#8F8F8F
hi DiffAdd                       guibg=#13354A
hi DiffChange      guifg=#89807D guibg=#4C4745
hi DiffDelete      guifg=#960050 guibg=#1E0010
hi DiffText                      guibg=#4C4745 gui=italic,bold

hi Directory       guifg=#A6E22E               gui=bold
hi Error           guifg=#960050 guibg=#1E0010
hi ErrorMsg        guifg=#3664FF guibg=#232526 gui=bold
hi Exception       guifg=#A6E22E               gui=bold
hi Float           guifg=#ffff00
hi FoldColumn      guifg=#465457 guibg=#000000
hi Folded          guifg=#465457 guibg=#000000
hi Function        guifg=#ffa600
hi Identifier      guifg=#FD971F
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#C4BE89 guibg=#000000

hi Keyword         guifg=#3664FF
hi Label           guifg=#E6DB74               gui=none
hi Macro           guifg=#C4BE89               gui=none
hi SpecialKey      guifg=#66D9EF               gui=none

hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
hi ModeMsg         guifg=#E6DB74
hi MoreMsg         guifg=#E6DB74
hi Operator        guifg=#3664FF

" complete menu
hi Pmenu           guifg=#66D9EF guibg=#000000
hi PmenuSel                      guibg=#808080
hi PmenuSbar                     guibg=#080808
hi PmenuThumb      guifg=#66D9EF

hi PreCondit       guifg=#ff0004               gui=bold
hi PreProc         guifg=#ff0004
hi Question        guifg=#66D9EF
hi Repeat          guifg=#3664FF
hi Search          guifg=#FFFFFF guibg=#455354
" marks column
hi SignColumn      guifg=#A6E22E guibg=#232526
hi SpecialChar     guifg=#3664FF               gui=bold
hi SpecialComment  guifg=#13c100               gui=bold
hi Special         guifg=#66D9EF guibg=bg      gui=none
hi SpecialKey      guifg=#888A85               gui=none
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#3664FF               gui=none
hi StatusLine      guifg=#455354 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808
hi StorageClass    guifg=#76BA00               gui=none
hi Structure       guifg=#AA00FF
hi Tag             guifg=#3664FF               gui=none
hi Title           guifg=#FFFFFF               gui=none
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

hi Typedef         guifg=#AA00FF
hi Type            guifg=#AA00FF               gui=none
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#403D3D
hi Visual                        guibg=#403D3D
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#66D9EF guibg=#000000

hi mySpecialSymbols guifg=cyan  gui=NONE
hi ColorColumn     guibg=#3B3A32

hi Normal          guifg=#F8F8F2 guibg=#000000
hi Comment         guifg=#13c100               gui=none
hi CursorLine                    guibg=#1F1F1F
hi CursorColumn                  guibg=#293739
hi LineNr          guifg=#3D3D3D guibg=black
hi NonText         guifg=#BCBCBC guibg=#232526

hi! link htmlValue Normal

"
" Support for 256-color terminal
"
if &t_Co > 255
    hi Boolean         ctermfg=226  ctermbg=NONE cterm=NONE
    hi Character       ctermfg=186  ctermbg=NONE cterm=NONE
    hi Number          ctermfg=226  ctermbg=NONE cterm=NONE
    hi String          ctermfg=34  ctermbg=NONE cterm=NONE
    "hi String          ctermfg=186  ctermbg=NONE cterm=NONE
    hi Conditional     ctermfg=63   ctermbg=NONE cterm=NONE
    hi Constant        ctermfg=226  ctermbg=NONE cterm=NONE
    hi Cursor          ctermfg=16   ctermbg=255  cterm=NONE
    hi Debug           ctermfg=248  ctermbg=NONE cterm=bold
    hi Define          ctermfg=81   ctermbg=NONE cterm=NONE
    hi Delimiter       ctermfg=246  ctermbg=NONE cterm=NONE

    hi DiffAdd         ctermfg=NONE ctermbg=NONE ctermbg=236
    hi DiffChange      ctermfg=244  ctermbg=238  cterm=NONE
    hi DiffDelete      ctermfg=89   ctermbg=233  cterm=NONE
    hi DiffText        ctermfg=NONE ctermbg=238  cterm=bold

    hi Directory       ctermfg=148  ctermbg=NONE cterm=bold
    hi Error           ctermfg=89   ctermbg=233  cterm=NONE
    hi ErrorMsg        ctermfg=63   ctermbg=235  cterm=bold
    hi Exception       ctermfg=148  ctermbg=NONE cterm=bold
    hi Float           ctermfg=226  ctermbg=NONE cterm=NONE
    hi FoldColumn      ctermfg=239  ctermbg=16   cterm=NONE
    hi Folded          ctermfg=239  ctermbg=16   cterm=NONE
    hi Function        ctermfg=214  ctermbg=NONE cterm=NONE
    hi Identifier      ctermfg=208  ctermbg=NONE cterm=NONE
    hi Ignore          ctermfg=244  ctermbg=0    cterm=NONE
    hi IncSearch       ctermfg=180  ctermbg=16   cterm=NONE

    hi Keyword         ctermfg=63   ctermbg=NONE cterm=NONE
    hi Label           ctermfg=186  ctermbg=NONE cterm=NONE
    hi Macro           ctermfg=180  ctermbg=NONE cterm=NONE
    hi SpecialKey      ctermfg=81   ctermbg=NONE cterm=NONE

    hi MatchParen      ctermfg=16   ctermbg=208  cterm=NONE
    hi ModeMsg         ctermfg=186  ctermbg=NONE cterm=NONE
    hi MoreMsg         ctermfg=186  ctermbg=NONE cterm=NONE
    hi Operator        ctermfg=63   ctermbg=NONE cterm=NONE

    " complete menu
    hi Pmenu           ctermfg=81   ctermbg=16   cterm=NONE
    hi PmenuSel        ctermfg=NONE ctermbg=NONE ctermbg=244
    hi PmenuSbar       ctermfg=NONE ctermbg=NONE ctermbg=232
    hi PmenuThumb      ctermfg=81   ctermbg=NONE cterm=NONE

    hi PreCondit       ctermfg=196  ctermbg=NONE cterm=bold
    hi PreProc         ctermfg=196  ctermbg=NONE cterm=NONE
    hi Question        ctermfg=81   ctermbg=NONE cterm=NONE
    hi Repeat          ctermfg=63   ctermbg=NONE cterm=NONE
    hi Search          ctermfg=231  ctermbg=239  cterm=NONE

    hi SignColumn      ctermfg=148  ctermbg=235  cterm=NONE
    hi SpecialChar     ctermfg=63   ctermbg=NONE cterm=bold
    hi SpecialComment  ctermfg=34   ctermbg=NONE cterm=bold
    hi Special         ctermfg=81   ctermbg=232  cterm=NONE
    hi SpecialKey      ctermfg=102  ctermbg=NONE cterm=NONE

    hi Statement       ctermfg=63   ctermbg=NONE cterm=NONE
    hi StatusLine      ctermfg=239  ctermbg=253  cterm=NONE
    hi StatusLineNC    ctermfg=244  ctermbg=232  cterm=NONE
    hi StorageClass    ctermfg=106  ctermbg=NONE cterm=NONE
    hi Structure       ctermfg=129  ctermbg=NONE cterm=NONE
    hi Tag             ctermfg=63   ctermbg=NONE cterm=NONE
    hi Title           ctermfg=231  ctermbg=NONE cterm=NONE
    hi Todo            ctermfg=231  ctermbg=232  cterm=bold

    hi Typedef         ctermfg=129  ctermbg=NONE cterm=NONE
    hi Type            ctermfg=129  ctermbg=NONE cterm=NONE
    hi Underlined      ctermfg=244  ctermbg=NONE cterm=NONE

    hi VertSplit       ctermfg=244  ctermbg=232  cterm=NONE
    hi VisualNOS       ctermfg=NONE ctermbg=237  cterm=NONE
    hi Visual          ctermfg=NONE ctermbg=237  cterm=NONE
    hi WarningMsg      ctermfg=231  ctermbg=236  cterm=bold
    hi WildMenu        ctermfg=81   ctermbg=16   cterm=NONE

    hi Normal          ctermfg=255  ctermbg=16   cterm=NONE
    hi Comment         ctermfg=244   ctermbg=NONE cterm=NONE
    "hi Comment         ctermfg=34   ctermbg=NONE cterm=NONE
    hi CursorLine      ctermfg=NONE ctermbg=234  cterm=NONE
    hi CursorColumn    ctermfg=NONE ctermbg=236  cterm=NONE
    hi LineNr          ctermfg=237  ctermbg=234  cterm=NONE
    hi NonText         ctermfg=250  ctermbg=235  cterm=NONE
end
