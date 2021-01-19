set number
set incsearch
set cindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set inccommand=split
set tabstop=4
set shiftwidth=4
set softtabstop=0
set autoindent
set smartindent
set autoread
set nobackup
set noswapfile
set scrolloff=8					" 上下8行の視界を確保
set sidescrolloff=16			" 左右スクロール時の視界を確保
set sidescroll=1				" 左右スクロールは一文字づつ行う" nnoremap <silent> <C-g> <ESC>
set shellslash					" Windows でもパスの区切り文字を / にする
set iminsert=2					" インサートモードから抜けると自動的にIMEをオフにする
set noerrorbells				" エラーメッセージの表示時にビープを鳴らさない
set cursorline					" カーソルラインをハイライト"
:se list
:se ff=dos
fileformats=unix,dos,mac


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

"https://postd.cc/how-to-boost-your-vim-productivity/nnoremap
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"https://qiita.com/delphinus/items/a202d0724a388f6cdbc3
set termguicolors    " ターミナルでも True Color を使えるようにする。
"set pumblend=10      " 0 〜 100 が指定できます。ドキュメントによると 5 〜 30 くらいが適当だそうです。
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" 以下はおまけ。ここでは Denite の設定を載せていますが、
" 同様の仕組みで任意のウィンドウを半透明化できるでしょう。
augroup transparent-windows
  autocmd!
  autocmd FileType denite set winblend=10  " こちらも 5 〜 30 で試してみてください。
  autocmd FileType denite-filter set winblend=10
augroup END
" 文字の色を黒、背景色を緑に変更
hi NormalFloat guifg=#2e3440 guibg=#5e81ac

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch


" メッセージ表示欄を2行確保
"set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline

" コマンドラインの履歴を10000件保存する
set history=10000


" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" スワップファイルを作成しない
set noswapfile

" https://itchyny.hatenablog.com/entry/2014/12/25/090000
" 保管の最大表示数を設定
set pumheight=10
set showmatch
set matchtime=1
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

function! s:home()
  let start_column = col('.')
  normal! ^
  if col('.') == start_column
  ¦ normal! 0
  endif
  return ''
endfunction

function! s:kill()
  let [text_before, text_after] = s:split_line()
  if len(text_after) == 0
  ¦ normal! J
  else
  ¦ call setline(line('.'), text_before)
  endif
  return ''
endfunction

function! s:split_line()
  let line_text = getline(line('.'))
  let text_after  = line_text[col('.')-1 :]
  let text_before = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before, text_after]
endfunction



" setting of dein
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	if dein#check_install()
		call dein#install()
	endif

	call dein#load_toml('~/.config/nvim/dein.toml',			{'lazy': 0})
	call dein#load_toml('~/.config/nvim/dein_lazy.toml',	{'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable


