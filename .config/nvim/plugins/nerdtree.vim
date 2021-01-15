autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeIgnore = ['.[oa]$', '.(so)$', '.(tgz|gz|zip)$' ]
let NERDTreeShowHidden = 1

map <leader><C-t> :NERDTreeToggle<CR>
nnoremap <leader>t :NERDTreeFocus<CR>
"nnoremap <leader><C-n> :NERDTree<CR>
"nnoremap <leader><C-f> :NERDTreeFind<CR>

