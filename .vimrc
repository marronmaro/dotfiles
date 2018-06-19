" [プラグインインストールコマンド]
" :call dein#install()
"
" [PHP辞書ファイル作成]
" php -r '$f=get_defined_functions();echo join("\n",$f["internal"]);' | sort > ~/.vim/dict/php.dict

"[vi互換モード解除]
if &compatible
  set nocompatible
endif

"[Install]
let s:dein_dir = expand('~/.vim/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

"[Runtime Path]
execute 'set runtimepath^=' . s:dein_repo_dir

"[Plugins]
call dein#begin(s:dein_dir)

"パッケージ管理プラグイン
call dein#add('Shougo/dein.vim')

"ステータスラインのカスタマイズプラグイン
call dein#add('itchyny/lightline.vim')

"テータスラインにブランチ名を表示するためのプラグイン
call dein#add('itchyny/vim-gitbranch')

"カラースキーマ
call dein#add('tomasr/molokai')

"call dein#add('dracula/vim')

"call dein#add('sonph/onehalf')

"PHPとHTMLが混在している場合にもオートインデントを効かせるプラグイン
call dein#add('captbaritone/better-indent-support-for-php-with-html')

"TABを可視化するプラグイン
call dein#add('nathanaelkane/vim-indent-guides')

"Lintを実行するためのプラグイン
call dein#add('w0rp/ale')

"統合環境を作るためのプラグイン
"call dein#add('Shougo/unite.vim')

"ファイル検索用のプラグイン
"call dein#add('ctrlpvim/ctrlp.vim')

"vue用プラグイン
call dein#add('posva/vim-vue')

"EasyMotion
call dein#add('Lokaltog/vim-easymotion')

"Goの開発環境用のプラグイン
"GoInstallBinariesの実行が必要
call dein#add('fatih/vim-go')

"markdownプレビュー用のプラグイン
call dein#add('kannokanno/previm')

"vimからブラウザを開くプラグイン
call dein#add('tyru/open-browser.vim')

"vimからGitを操作するプラグイン
call dein#add('tpope/vim-fugitive')

call dein#end()

call dein#save_state()

"存在しないプラグインをインストール
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on

"[Functions]
"末尾の空白を削除
function! DeleteLastSpace()
    let cursor = getpos(".")
    %s/\s\+$//ge
    call setpos(".", cursor)
    unlet cursor
endfunction

"LintのWarningをステータスバーに表示する
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('▲%d', all_non_errors)
endfunction

"LintのErrorをステータスバーに表示する
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('✖︎ %d', all_errors)
endfunction

"[基本設定]
"シンタックスハイライトを有効化
syntax enable

"内部文字コード
set encoding=utf-8

"文字コードの自動判別
set fileencodings=utf-8,cp932,euc-jp,iso-20220-jp,default,latin

"改行コードを自動認識
set fileformats=unix,dos,mac

"保存する時の改行コード
set fileformat=unix

"TAB入力にスペースを使う
set expandtab

"TABが占める幅
set tabstop=4

"自動インデントで追加される半角スペースの数
set shiftwidth=4

"TABを入力した時に何文字の半角スペースを追加するか
set softtabstop=4

"自動インデントを有効化
set autoindent

"カーソル行に背景を指定
set cursorline

"スクロール時のバッファ行数
set scrolloff=8

"Backspaceの挙動を変更
set backspace=indent,eol,start

set backupcopy=yes

"バックアップファイルを作らない
"set nobackup

"swapファイルの保存先を変更
set directory=/tmp

"set noswapfile

"行数表示
set number

"検索結果をハイライト
set hlsearch

"クリップボードを共有
"set clipboard=unnamed,autoselect
set clipboard=unnamed

"全角でカーソル位置がずれる事象を解消
set ambiwidth=double

"対応する括弧を強調
set showmatch

"大文字と小文字を区別しないで検索
set ignorecase

"小文字で検索した時のみ大文字と小文字を区別しない
set smartcase

"ステータスの表示
set laststatus=2

"エラーメッセージ表示時のビープ音を鳴らさない
set noerrorbells

"ビープ音を音ではなく視覚表示and表示内容が空なら何もしない
set vb t_vb=

set wildmode=list:longest

"改行等の情報可視化
"set list

"可視化情報の変更
"set listchars=tab:>-,precedes:<,extends:>,eol:↲

"ファイル変更中に他のファイルを開けるようにする
set hidden

"長い行を@にしない
set display=lastline

"CUIの場合は256色を有効
if !has('gui_running')
    set t_Co=256
endif

"jjを押した時にノーマルモードにする
inoremap <silent> jj <ESC>

"カラースキーマの設定
colorscheme molokai

"color dracula

"[molokai]設定
"背景が修正
set background=dark

let g:molokai_original = 1

let g:rehash256 = 1

"検索結果が画面中央に来るようスクロール
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

"Escを押した際にIMEを無効化する
"MacでGoogle日本語入力を仕様している場合は、Google日本語の設定でESCを押した時にIMEを無効化する設定をする

"autocmdグループ(共通)
augroup group
    autocmd!

    "Insertモードを抜けた時、貼り付けモードを解除
    autocmd InsertLeave * set nopaste

    "Grepを実行した時にquickfixを自動起動させる
    autocmd QuickFixCmdPost make,grep,grepadd,vimgrep copen

    "全角スペースの可視化
    autocmd BufNewFile,BufRead * match ZenkakuSpace /　/

    "PHP辞書を設定
    autocmd FileType php :set dictionary=~/.vim/dict/php.dict

    "末尾の余分なスペースを削除
    autocmd BufWritePre *.php call DeleteLastSpace()

    autocmd BufWritePre *.vue call DeleteLastSpace()

    autocmd BufWritePre *.js call DeleteLastSpace()

    "vueのハイライトがうまくいかないことがある
    autocmd FileType vue syntax sync fromstart

augroup END


"[lightlineの設定]
"カラースキーマの設定
let g:lightline = {
    \'colorscheme': 'wombat',
    \ 'active': {
        \'left': [ [ 'mode', 'paste' ],
            \[ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
        \'right': [['lineinfo'], ['percent'], ['readonly'], ['fileformat', 'fileencoding', 'filetype'], ['linter_warnings', 'linter_errors']]
    \},
    \'component_function': {
    \   'gitbranch': 'gitbranch#name',
    \   'linter_warnings': 'LightlineLinterWarnings',
    \   'linter_errors': 'LightlineLinterErrors'
    \},
    \}

"[vim-indent-guidesの設定]
"vimを開いた時にvim-indent-guidesを使用するか
let g:indent_guides_enable_on_vim_startup=1

"自動カラーを使用するか
let g:indent_guides_auto_colors = 0

"奇数インデントのカラー
hi IndentGuidesOdd ctermbg=234

" 偶数インデントのカラー
hi IndentGuidesEven ctermbg=235

"全角スペースの表示内容定義
hi ZenkakuSpace cterm=reverse ctermfg=9 guibg=#666666

"カレント行の色を変更
"hi CursorLine cterm=NONE ctermfg=NONE ctermbg=235

"コメントの色を変更
hi Comment cterm=NONE ctermfg=244

"[ALEの設定]
"基本的に重いので手動で:ALELintを手動で実行する運用にした

"常にエラー表示エリアを常に表示するか
let g:ale_sign_column_always = 0

"PHPのphpcs実行時のstandardオプションを指定
let s:phpcs_standard = 'PSR2'
let s:phpcs_ruleset_filename = 'phpcs_ruleset.xml'
if filereadable(getcwd() . '/' . s:phpcs_ruleset_filename)
    let s:phpcs_standard = s:phpcs_ruleset_filename
endif
let g:ale_php_phpcs_standard=s:phpcs_standard

"ロケーションリストを使用するか
let g:ale_set_loclist = 0

"ロケーションリストの代わりにquickfixを使用するか
let g:ale_set_quickfix = 1

"保存時に規約チェックを実行するか
let g:ale_lint_on_save = 0

"テキスト変更時に規約チェックを実行するか
let g:ale_lint_on_text_changed = 'never'

"ファイルオープン時に規約チェックを実行するか
let g:ale_lint_on_enter = 0

"ファイルタイプが変更された時に規約チェックを実行するか
let g:ale_lint_on_filetype_changed = 0

"Lint実行時にエラー一覧を表示するか
let g:ale_open_list = 1

"Signエリアを表示するか
let g:ale_set_signs=0


"[vim-go]
"Go言語のメソッドをハイライト
let g:go_highlight_methods = 1
"Go言語の構造体をハイライト
let g:go_highlight_structs = 1
"Go言語の関数をハイライト
let g:go_highlight_functions = 1
"Build Constraintsをハイライト
"コメントブロックでOSによってビルドするか判断するもの
let g:go_highlight_build_constraints = 1
