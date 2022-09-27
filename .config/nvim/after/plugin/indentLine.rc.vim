
" indentLine will overwrite 'conceal' color with grey by default. If you want to highlight conceal color with your colorscheme, disable by:
" let g:indentLine_setColors = 0

" Or you can use the same colors as another highlight group. To use the same colors that are used for tab indents, use the 'SpecialKey' group:
" let g:indentLine_defaultGroup = 'SpecialKey'

" Or you can customize conceal color by:
" Vim
" let g:indentLine_color_term = 239
" GVim
" let g:indentLine_color_gui = '#A4E57E'
" none X terminal
" let g:indentLine_color_tty_light = 7 " (default: 4)
" let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_bgcolor_gui = '#FF5F00'
"
" Change Indent Char
" Vim and GVim
" let g:indentLine_char = 'c'

" where 'c' can be any ASCII character. You can also use one of ¦, ┆, │, ⎸, or ▏ to display more beautiful lines. However, these characters will only work with files whose encoding is UTF-8.
" or
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" each indent level has a distinct character.

