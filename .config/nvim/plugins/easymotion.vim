let g:EasyMotion_do_mapping = 0 " Disable default mappings

" map <Leader><Leader> <Plug>(easymotion-prefix)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1


" <Leader>f{char} to move to {char}
map  <Leader>e <Plug>(easymotion-bd-f)
nmap <Leader><Leader>e <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader><Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>L <Plug>(easymotion-overwin-line)
"
" Move to word
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

" JK motions: Line motions
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)

