" Description: Keymaps

let mapleader = "\<Space>"

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
" nmap te :tabedit
" nmap <S-Tab> :tabprev<Return>
" nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
" nmap ss :split<Return><C-w>w
" nmap sv :vsplit<Return><C-w>w
nmap <Leader>ss :split<Return><C-w>w
nmap <Leader>sv :vsplit<Return><C-w>w
nmap <Leader>se <C-w>=<Return><C-w>w


imap <C-g> <esc>
nnoremap <C-g> <esc>         " Remap in Normal mode
inoremap <C-g> <esc>         " Remap in Insert and Replace mode
vnoremap <C-g> <esc>         " Remap in Visual and Select mode
xnoremap <C-g> <esc>         " Remap in Visual mode
snoremap <C-g> <esc>         " Remap in Select mode
cnoremap <C-g> <C-C>         " Remap in Command-line mode
onoremap <C-g> <esc>         " Remap in Operator pending mode
" https://qiita.com/itmammoth/items/312246b4b7688875d023
" xやsではヤンクしない
nnoremap x "_x
nnoremap s "_s

nnoremap k gk
nnoremap j gj


"https://postd.cc/how-to-boost-your-vim-productivity/nnoremap
nnoremap <Leader>w :w<CR>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" nnoremap <silent> <S-Left[> :bp<CR>
" nnoremap <silent> <S-Right]> :bn<CR>

" https://itchyny.hatenablog.com/entry/2014/12/25/090000
nnoremap + <C-a>
nnoremap - <C-x>

" Escの2回押しでハイライト消去
nnoremap <C-g><C-g> :nohlsearch<CR><ESC>


"挿入モード終了時にIMEをオフ
inoremap <silent> <Esc> <Esc>:call system('fcitx-remote -c')<CR>

" like emacs
" insert mode
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill()<CR>

