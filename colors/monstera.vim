set background=light

hi clear
let g:colors_name = 'monstera'

" see :h term_setansicolors
" mostly keep it dark because I want contrast
let g:terminal_ansi_colors = ['#000000', '#CC3E28', '#618774', '#B58900', '#1E6FCC', '#5C21A5', '#56949F', '#AAAAAA', '#555555', '#D685AF', '#216609', '#EA9D34', '#1E6FCC', '#9A7599', '#158c86', '#C8CFDE']

" Generic highlight groups
hi Normal guifg=black guibg=white gui=NONE cterm=NONE
hi NonText guifg=grey54 guibg=NONE gui=NONE cterm=NONE
hi ColorColumn guibg=#f2eede guibg=NONE gui=NONE cterm=NONE
hi Conceal guifg=lightgrey guibg=NONE gui=NONE cterm=NONE
hi Comment guifg=black guibg=NONE gui=NONE cterm=italic
hi Cursor guibg=#AAAAAA guifg=NONE gui=NONE cterm=NONE
hi CursorLine cterm=NONE guifg=black guibg=NONE
hi CursorLineNR cterm=bold guifg=black
hi Directory guifg=#5C21A5 guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#CC3E28 guibg=NONE gui=NONE cterm=bold
hi Folded guifg=NONE guibg=#AAAAAA gui=NONE cterm=NONE
hi FoldColumn guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi SignColumn guifg=NONE guibg=bg gui=NONE cterm=NONE
hi IncSearch guifg=fg guibg=gold gui=NONE cterm=NONE
hi! link Search IncSearch
hi LineNr guifg=black guibg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=NONE guibg=NONE gui=NONE ctermbg=NONE cterm=bold,underline
hi Pmenu guifg=black guibg=papayawhip gui=NONE cterm=NONE
hi PmenuSel guifg=black guibg=papayawhip gui=bold cterm=bold
hi Question guifg=black guibg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=black guibg=NONE gui=bold,underline cterm=bold,underline
hi StatusLine guifg=black guibg=papayawhip gui=NONE cterm=NONE
hi StatusLineNC guifg=grey40 guibg=papayawhip gui=NONE cterm=NONE
hi StatusLineTerm guifg=darkgreen guibg=NONE gui=NONE cterm=NONE
hi StatusLineTermNC guifg=darkgreen guibg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=black guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#CC3E28 guibg=NONE gui=undercurl cterm=NONE
hi! link SpellCap SpellBad
hi! link SpellLocal SpellBad
hi! link SpellRare SpellBad
hi TabLine guifg=black guibg=NONE gui=NONE cterm=NONE
hi TabLineSel guifg=black guibg=NONE gui=NONE cterm=bold,underline
hi TabLineFill guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi Title guifg=orangered guibg=NONE gui=NONE cterm=NONE
hi WarningMsg guifg=#EA9D34 guibg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=black guibg=papayawhip gui=NONE cterm=bold,underline

hi Constant guifg=#0060cf guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=black guibg=NONE gui=NONE cterm=bold
hi Function guifg=black guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=black guibg=NONE gui=NONE cterm=bold
hi PreProc guifg=#520e9f guibg=NONE gui=NONE cterm=NONE
hi Type guifg=#078781 guibg=NONE gui=NONE cterm=NONE
hi Special guifg=black guibg=NONE gui=NONE cterm=NONE
hi Debug guifg=#CC3E28 guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=black guibg=NONE gui=NONE cterm=underline
hi Error guifg=bg guibg=red gui=NONE cterm=NONE
hi Todo guifg=black guibg=yellow gui=NONE cterm=NONE

" Diffs
hi DiffAdd guifg=black guibg=moccasin gui=NONE cterm=NONE
hi DiffChange guifg=black guibg=moccasin gui=NONE cterm=NONE
hi DiffDelete guifg=grey54 guibg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#800000 guibg=NONE gui=NONE cterm=NONE

" netrw
hi! link netrwClassify Identifier

" ALE
hi AleErrorSign guifg=red guibg=NONE gui=NONE cterm=NONE
hi AleVirtualTextError guifg=NONE guibg=NONE gui=NONE cterm=italic
