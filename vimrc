"双引号开始的行为注释行，下同
"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible

"显示行号
set number

"检测文件的类型
filetype on

"记录历史的行数
set history=1000

"语法高亮度显示
syntax on

"下面两行在进行编写代码时，在格式对起上很有用；
"第一行，vim使用自动对起，也就是把当前行的对起格式应用到下一行；
"第二行，依据上面的对起格式，智能的选择对起方式，对于类似C语言编写上很有用
"set autoindent
set smartindent
"set cindent

"一直显示状态
set laststatus=2

"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格
set tabstop=4
set shiftwidth=4
"set inde=&shiftwidth

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch
"去除vim的GUI版本中的toolbar
set guioptions=T
"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
set vb t_vb=
"在编辑过程中，在右下角显示光标位置的状态行
set ruler
"默认情况下，寻找匹配是高亮度显示的，该设置关闭高亮显示
set nohls
"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回车
set incsearch
"搜索忽略大小写
set ignorecase
"高亮括号
"set showmatch
set cursorcolumn cursorline
"修改一个文件后，自动进行备份，备份的文件名为原文件名加"~"后缀
"if has("vms") "注意双引号要用半角的引号"　"
"set nobackup
"else
"set backup
"endif
set encoding=utf-8
let &termencoding=&encoding
set fileencodings=ucs-bom,utf-8,gbk
"启用鼠标
"set mouse=a

""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""
"开始使用Vundle的必须配置
set nocompatible
"filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"使用Vundle来管理Vundle
Bundle 'gmarik/vundle'

"Vundle配置必须 开启插件
filetype plugin on
filetype indent on

Bundle 'winmanager'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'taglist.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'dgryski/vim-godef'
Bundle 'Blackrush/vim-gocode'
Bundle 'majutsushi/tagbar'
Bundle 'udonmai/Conque-Shell'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'cespare/vim-golang'
Bundle 'corntrace/bufexplorer'
Bundle 'spf13/vim-colors'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-fugitive'

""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start() 
  exe 'NERDTree'
endfunction
function! NERDTree_IsValid() 
  return 1 
endfunction

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

""""""""""""""""""""""""""""""
" WinManager
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='NERDTree|BufExplorer'
let g:persistentBehaviour=0   
let g:winManagerWidth=20
let g:defaultExplorer=1
map <c-w><c-t> :WMToggle<cr>
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>

""""""""""""""""""""""""""""""
" PowerLine
""""""""""""""""""""""""""""""
"PowerLine插件 状态栏增强展示
"vim有一个状态栏 加上powline则有两个状态栏
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'

""""""""""""""""""""""""""""""
" Conque-Shell
""""""""""""""""""""""""""""""
let g:ConqueTerm_TERM ='xterm'
nmap <Leader>sh :ConqueTerm bash<CR>
nmap <Leader>shs :ConqueTermSplit bash<CR>
nmap <Leader>shv :ConqueTermVSplit bash<CR>
nmap <Leader>sht :ConqueTermTab bash<CR>

""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""
map <c-t><c-b> :TagbarToggle<cr>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

""""""""""""""""""""""""""""""
" MiniBufExplorer 
""""""""""""""""""""""""""""""
let g:miniBufExplorerMoreThanOne=0
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

""""""""""""""""""""""""""""""
" goimports
""""""""""""""""""""""""""""""
"let g:gofmt_command = "goimports"
"autocmd BufWritePre*.go :Fmt

""""""""""""""""""""""""""""""
" gocode
""""""""""""""""""""""""""""""
autocmd FileType go set omnifunc=gocomplete#Complete
set completeopt=longest,menu
autocmd BufWritePre *.go :Fmt
inoremap <c-j> <c-x><c-o>

"背景主题颜色
colorscheme hybrid
set t_Co=256 

"绑定调整窗口大小的快捷键
nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
nmap    w,  :vertical resize -3<CR>
nmap    w.  :vertical resize +3<CR>
