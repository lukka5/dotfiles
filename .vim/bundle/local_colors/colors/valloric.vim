set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="valloric"


if &t_Co > 255
    "
    " Support for 256-color terminal
    "
    hi Boolean         ctermfg=226  ctermbg=none cterm=none
    hi Character       ctermfg=186  ctermbg=none cterm=none
    hi Number          ctermfg=226  ctermbg=none cterm=none
    hi String          ctermfg=34   ctermbg=none cterm=none
    hi Conditional     ctermfg=63   ctermbg=none cterm=none
    hi Constant        ctermfg=226  ctermbg=none cterm=none
    hi Cursor          ctermfg=16   ctermbg=255  cterm=none
    hi Debug           ctermfg=248  ctermbg=none cterm=bold
    hi Define          ctermfg=81   ctermbg=none cterm=none
    hi Delimiter       ctermfg=246  ctermbg=none cterm=none

    hi DiffAdd         ctermfg=none ctermbg=22   cterm=none
    hi DiffChange      ctermfg=none ctermbg=24   cterm=none
    hi DiffDelete      ctermfg=88   ctermbg=88   cterm=none
    hi DiffText        ctermfg=none ctermbg=24   cterm=bold

    hi Directory       ctermfg=148  ctermbg=none cterm=bold
    hi Error           ctermfg=89   ctermbg=233  cterm=none
    hi ErrorMsg        ctermfg=63   ctermbg=235  cterm=bold
    hi Exception       ctermfg=148  ctermbg=none cterm=bold
    hi Float           ctermfg=226  ctermbg=none cterm=none
    hi FoldColumn      ctermfg=239  ctermbg=16   cterm=none
    hi Folded          ctermfg=239  ctermbg=16   cterm=none
    hi Function        ctermfg=214  ctermbg=none cterm=none
    hi Identifier      ctermfg=208  ctermbg=none cterm=none
    hi Ignore          ctermfg=244  ctermbg=0    cterm=none
    hi IncSearch       ctermfg=180  ctermbg=16   cterm=none

    hi Keyword         ctermfg=63   ctermbg=none cterm=none
    hi Label           ctermfg=186  ctermbg=none cterm=none
    hi Macro           ctermfg=180  ctermbg=none cterm=none
    hi SpecialKey      ctermfg=81   ctermbg=none cterm=none

    hi MatchParen      ctermfg=16   ctermbg=208  cterm=none
    hi ModeMsg         ctermfg=186  ctermbg=none cterm=none
    hi MoreMsg         ctermfg=186  ctermbg=none cterm=none
    hi Operator        ctermfg=63   ctermbg=none cterm=none

    " complete menu
    hi Pmenu           ctermfg=81   ctermbg=16   cterm=none
    hi PmenuSel        ctermfg=none ctermbg=244  cterm=none
    hi PmenuSbar       ctermfg=none ctermbg=232  cterm=none
    hi PmenuThumb      ctermfg=81   ctermbg=none cterm=none

    hi PreCondit       ctermfg=196  ctermbg=none cterm=bold
    hi PreProc         ctermfg=196  ctermbg=none cterm=none
    hi Question        ctermfg=81   ctermbg=none cterm=none
    hi Repeat          ctermfg=63   ctermbg=none cterm=none
    hi Search          ctermfg=231  ctermbg=239  cterm=none

    hi SignColumn      ctermfg=none ctermbg=232  cterm=none
    hi SpecialChar     ctermfg=63   ctermbg=none cterm=bold
    hi SpecialComment  ctermfg=34   ctermbg=none cterm=bold
    hi Special         ctermfg=81   ctermbg=232  cterm=none
    hi SpecialKey      ctermfg=102  ctermbg=none cterm=none

    if has("spell")
        hi SpellBad    ctermfg=9    ctermbg=none cterm=none
        hi SpellCap    ctermfg=9    ctermbg=none cterm=none
        hi SpellLocal  ctermfg=9    ctermbg=none cterm=none
        hi SpellRare   ctermfg=9    ctermbg=none cterm=none
    endif

    hi Statement       ctermfg=63   ctermbg=none cterm=none
    hi StatusLine      ctermfg=239  ctermbg=253  cterm=none
    hi StatusLineNC    ctermfg=244  ctermbg=232  cterm=none
    hi StorageClass    ctermfg=106  ctermbg=none cterm=none
    hi Structure       ctermfg=129  ctermbg=none cterm=none
    hi Tag             ctermfg=63   ctermbg=none cterm=none
    hi Title           ctermfg=231  ctermbg=none cterm=none
    hi Todo            ctermfg=231  ctermbg=232  cterm=bold

    hi Typedef         ctermfg=129  ctermbg=none cterm=none
    hi Type            ctermfg=129  ctermbg=none cterm=none
    hi Underlined      ctermfg=244  ctermbg=none cterm=none

    hi VertSplit       ctermfg=244  ctermbg=232  cterm=none
    hi VisualNOS       ctermfg=none ctermbg=237  cterm=none
    hi Visual          ctermfg=none ctermbg=237  cterm=none
    hi WarningMsg      ctermfg=231  ctermbg=236  cterm=bold
    hi WildMenu        ctermfg=81   ctermbg=16   cterm=none

    hi Normal          ctermfg=255  ctermbg=232  cterm=none
    hi Comment         ctermfg=244  ctermbg=none cterm=none
    hi CursorLine      ctermfg=none ctermbg=234  cterm=none
    hi CursorColumn    ctermfg=none ctermbg=236  cterm=none
    hi LineNr          ctermfg=238  ctermbg=232  cterm=none
    hi NonText         ctermfg=250  ctermbg=232  cterm=none
else
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

    hi mySpecialSymbols guifg=cyan  gui=none
    hi ColorColumn     guibg=#3B3A32

    hi Normal          guifg=#F8F8F2 guibg=#000000
    hi Comment         guifg=#13c100               gui=none
    hi CursorLine                    guibg=#1F1F1F
    hi CursorColumn                  guibg=#293739
    hi LineNr          guifg=#3D3D3D guibg=black
    hi NonText         guifg=#BCBCBC guibg=#232526

    hi! link htmlValue Normal
endif
