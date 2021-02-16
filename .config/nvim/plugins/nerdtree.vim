
" Open NERDTree on gvim/macvim startup
let g:nerdtree_tabs_open_on_gui_startup = 1

" Open NERDTree on console vim startup
let g:nerdtree_tabs_open_on_console_startup = 1

" Do not open NERDTree if vim starts in diff mode
let g:nerdtree_tabs_no_startup_for_diff = 0

" On startup - focus NERDTree when opening a directory, focus the file if
" editing a specified file. When set to `2`, always focus file after startup.
let g:nerdtree_tabs_smart_startup_focus = 2


" let g:NERDTreeWinSize=50
" let g:NERDTreeShowBookmarks=1
let g:NERDTreeMapUpdir='<C-u>'
" let g:NERDTreeMapOpenSplit='<C-j>'
" let g:NERDTreeMapOpenVSplit='<C-l>'
let g:NERDTreeQuitOnOpen=1
" 隠しファイルを表示
let g:NERDTreeShowHidden=1
let NERDTreeShowHidden = 1

let NERDTreeIgnore = ['.[oa]$', '.(so)$', '.(obj)$', '.(tgz|gz|zip)$' ]

" Synchronize view of all NERDTree windows (scroll and cursor position)
" let g:nerdtree_tabs_synchronize_view = 1

" Synchronize focus when switching tabs (focus NERDTree after tab switch
" if and only if it was focused before tab switch)
" let g:nerdtree_tabs_synchronize_focus = 1

" map <leader>nt :NERDTreeToggle<CR>
map <leader>nt :NERDTreeMirrorToggle<CR>
" nnoremap <leader>t :NERDTreeFocus<CR>
"nnoremap <leader><C-n> :NERDTree<CR>
"nnoremap <leader><C-f> :NERDTreeFind<CR>

" 開かない、という選択ができなかった。
" PRESS ENTER とか出るので。なので開いて閉じることにした
" :NERDTreeMirrorToggle
" :NERDTreeMirrorToggle

