
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" https://secret-garden.hatenablog.com/entry/2015/04/16/000000
" 括弧を追加する
map <silent> sa <Plug>(operator-surround-append)
" 括弧を削除する
map <silent> sd <Plug>(operator-surround-delete)
" 括弧を入れ替える
map <silent> sr <Plug>(operator-surround-replace)
" カーソル位置から一番近い括弧を削除する
nmap <silent> sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
" カーソル位置から一番近い括弧を変更する
nmap <silent> srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

