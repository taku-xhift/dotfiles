" Description: Keymaps

"nnoremap <S-C-p> "0p
" Delete without yank
" nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
"nnoremap + <C-a>
"nnoremap - <C-x>

" Delete a word backwards
"nnoremap dw vb"_d

" Select all
"nmap <C-a> gg<S-v>G

" Save with root permission
"command! W w !sudo tee > /dev/null %
"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

