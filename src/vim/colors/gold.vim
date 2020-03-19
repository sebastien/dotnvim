" Vim color file
"
" Author: Sébastien Pierre <sebastien.pierre@gmail.com>
"
hi clear
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

" BLUE_BRIGHT   #1F8AFC
" GREY          #B8B8B8
" ORANGE_YELLOW #F5C400
" ORANGE        #E3861C
" TEAL          #4ABAAB
" PURPLE_DK     #221924

hi normal        guifg=#B8B8B8 guibg=#221924

"Code syntax
hi link                Value     Identifier
hi link                Control   Statement
hi Comment             guifg=#2A93A1 guibg=#222B3B
hi Todo                guifg=#FCCB08 guibg=#4A473B
hi Constant            guifg=#1F8AFC
hi String              guifg=#1F8AFC guibg=#1A2A42
hi Special             guifg=#BD9800
hi Delimiter           guifg=#855600
hi Statement           guifg=#FFFFFF gui=bold
hi Operator            guifg=#FFFFFF gui=NONE
hi Identifier          guifg=#F5C400
hi PreProc             guifg=#2D89AD
hi Type                guifg=#E0E0E0 gui=bold
hi Underlined          guifg=#13BAED
hi Number              guifg=#11D9D2
hi Error               guibg=#401212 guifg=#C43333
hi NVimInternalError   guibg=#401212 guifg=#C43333

hi TrailingWhitespace  guibg=#881300 guifg=#CE1A2C
hi NonASCII            guibg=#1C3341 guifg=#DCF4F8

" Conceal
hi Conceal               guifg=#FFE21B guibg=#2A2A2A
hi ConcealStatement      guifg=#FFE21B guibg=#2A2A2A
hi ConcealStructure      guifg=#FFE21B gui=bold guibg=#2A2A2A
hi ConcealKeyword        guifg=#FFE21B guibg=#2A2A2A
hi ConcealOperator       guifg=#FFFFFF gui=bold guibg=#2A2A2A

"Vim syntax
hi SpecialKey    guifg=#4A4A4A
hi NonText       guifg=#3E2E42

hi Cursor        guibg=#A890A8 guifg=#042B01
hi CursorLine    guibg=#321C57
hi CursorLineNr  guifg=#A36FA3 guibg=#641F70
hi LineNr        guifg=#373766 guibg=#221924
hi Visual        guibg=#571663
hi Folded        guifg=#808080 guibg=#202020

hi Directory     guifg=#7D3F9E gui=bold
hi ErrorMsg      guibg=#401212 guifg=#C43333
hi Question      guifg=#A09E2E
hi Title         guifg=#FFFFFF gui=underline
hi Search        guifg=#09CDEB guibg=#0E648F gui=bold
hi IncSearch     guifg=#09CDEB guibg=#0D313D gui=NONE

hi WildMenu      guifg=#CCCCCC guibg=#1E1F1D

hi VertSplit     guifg=#221924 guibg=#373766

hi WildMenu      guibg=#41494D guifg=#62A4E8
hi MatchParen    guifg=#01a6f3 guibg=#105E6E



"Diff syntax
hi DiffAdd         guifg=#22AEEA guibg=#2F415C
hi DiffChange      guibg=#321C57 guifg=#714DB8
hi DiffDelete      guifg=#656565 guibg=#1C1C1C
hi DiffText guifg=#d19fa2 guibg=#2e2629 guisp=#2e2629 gui=NONE ctermfg=181 ctermbg=236 cterm=NONE


"TagBar syntax
hi clear TagbarKind
hi TagbarKind        guifg=#2A7679

"For the status bar:
" Active Status line
hi StatusLine    guibg=#A36FA3 guifg=#641F70
hi StatusLineNC  guibg=#A6A2BA guifg=#373766

hi TabLineFill   guibg=#A6A2BA guifg=#321C57
hi TabLine       guifg=#7242CC guibg=#321C57 gui=NONE
hi TabLineSel    guifg=#D41FDE guibg=#641F70

" - The RO flag
hi User2 term=bold gui=bold ctermfg=red  guifg=#930B58 guibg=black
" - The filename in the statusbar
hi User3 term=bold gui=bold ctermfg=grey guifg=#641F70 guibg=#A6A2BA

hi PMenu      guibg=#27134a guifg=#7242CC
hi PMenuSel   guibg=#27134a guifg=#D41FDE
hi PMenuSbar  guifg=#431A78 guibg=#E405F0
hi PMenuThumb guifg=#431A78 guibg=#E405F0

" - 3 shades of grey
hi User4 term=inverse gui=inverse ctermfg=grey guifg=#373766
hi User5 term=inverse gui=inverse ctermfg=grey guifg=#373766
hi User6 term=inverse gui=inverse ctermfg=grey guifg=#373766

" For columns
hi ColorColumn term=bold ctermbg=0 guibg=#281D29

" EOF
