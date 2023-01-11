
" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

let g:comfortable_motion_interval = 2400.0 / 60
let g:comfortable_motion_friction = 100.0
let g:comfortable_motion_air_drag = 3.0
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

set nocompatible
set number
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
" set expandtab
"let loaded_matchparen = 1
set shell=zsh
set backupskip=/tmp/*,/private/tmp/*
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set tabstop=4
set smarttab
set nobackup
set noswapfile
set scrolloff=8         " 上下8行の視界を確保
set sidescrolloff=16      " 左右スクロール時の視界を確保
set sidescroll=1        " 左右スクロールは一文字づつ行う" nnoremap <silent> <C-g> <ESC>
set shellslash          " Windows でもパスの区切り文字を / にする
set iminsert=0          " インサートモードから抜けると自動的にIMEをオフにする
set noerrorbells        " エラーメッセージの表示時にビープを鳴らさない
set cursorline          " カーソルラインをハイライト"
set foldcolumn=1        " 折りたたみ箇所を表示
set foldopen=tag,undo   " 折りたたみ内に移動する場合に開く条件。他には block,hor,mark,percent,quickfix,search
" set foldmethod=indent   " 折り畳み基準をインデントにする

autocmd! FileType haxe setlocal expandtab

set mouse=a


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

if has('persistent_undo')
  set undodir=~/.nvim/undo
  set undofile
endif



" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" indents
filetype plugin indent on
set shiftwidth=4
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish
" cpp
au BufNewFile,BufRead *.h set filetype=cpp
au BufNewFile,BufRead *.hpp set filetype=cpp

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
" autocmd FileType h,hpp,c,cpp setlocal expandtab shiftwidth=2 tabstop=2
  " au BufRead,BufNewFile *.cpp expandtab shiftwidth=2 tabstop=2

augroup filetypedetect
  au BufRead,BufNewFile *.hx expandtab
augroup END


runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif
if has('win32')
  runtime ./windows.vim
endif

runtime ./maps.vim

" true color
if exists("&termguicolors") && exists("&winblend")
syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  " let g:neosolarized_termtrans=1
  " runtime ./colors/NeoSolarized.vim
  " colorscheme NeoSolarized
 " let g:moonflyCursorColor = 1↲
  " let g:lightline = { 'colorscheme': 'moonfly' }
  colorscheme moonfly
  " colorscheme nord
endif

set exrc


" vim: set foldmethod=marker foldlevel=0:

