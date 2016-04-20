" author: will
" email: g.success16#gmail.com
" comment: go
"-----------------------------------------------------------

"                  vundle config 
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set nocompatible              " be iMproved, required
filetype off                  " required
"execute pathogen#infect()
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-pathogen'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete.vim'
Plugin 'wincent/command-t'
Plugin 'scrooloose/syntastic'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/EasyMotion'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
syntax on
runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()
call pathogen#helptags()
execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ================ vim base config =============

" 开启语法高亮
syntax on
" 替换esc
noremap qq <ESC>
"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
""好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=
"显示当前的行号列号：
set ruler
"""在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode
"显示行号：
set number
" 显示绝对行号
set relativenumber
" 括号配对情况,跳转并高亮一下匹配的括号
set showmatch
"设置文内智能搜索提示
"" 高亮search命中的文本。
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" " 搜索时忽略大小写
set ignorecase
" " 有一个或以上大写字母时仍大小写敏感
set smartcase     
" ignore case if search pattern is all lowercase, case-sensitive otherwise
" set t_Co=-256 while the colorscheme is molokai
" 
set t_Co=256
set clipboard=unnamed

"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <home>
cnoremap <C-e> <end>

colorscheme molokai
let g:rehash256 = 1
" --------------------vim-go config ------------------- 
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" let g:go_fmt_command = "goimports"

" Sometimes when using both vim-go and syntastic Vim will start lagging while
" saving and opening files. The following fixes this:
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" mapping 
map go :GoDoc<CR>

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>i <Plug>(go-info)

" ------------------NERDTree config-------------------

map ff :NERDTreeToggle<CR>

" -------------------neocomplete config ---------------- 
"  build vim with lua and ruby
"  ./configure --prefix=/usr --with-features=huge --enable-rubyinterp
"  --enable-pythoninterp --enable-luainterp --with-lua-prefix=/usr/local
let g:neocomplete#enable_at_startup = 1

" -------------------command-t config ------------------

map tt :CommandT<CR>

" -------------------pathogen.vim config --------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on
filetype plugin on
syntax on
" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0
let g:syntastic_enable_signs = 1

" ------------------ EasyMotion ---------------------
let g:EasyMotion_leader_key = '<Leader>'
hi EasyMotionTarget ctermbg=none ctermfg=green
hi EasyMotionShade  ctermbg=none ctermfg=blue

