" autoload .vimrc
"autocmd! bufwritepost ~/.vimrc source %

" basic setting
syntax enable
syntax on
set encoding=utf-8
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set nu
set mouse=v
set hidden "switch buffer without saving
set showtabline=0 "close the default tabline, and replace it with tabbar
set hls
"set statusline= 

" leader -> space key
let mapleader=" "

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %
"imap <c-s> :w<cr>
nnoremap <c-x> :w<cr>
inoremap <c-x> <ESC>:w<cr>

" ==== highlight search toggle ==============
nnoremap <expr> <leader>h Highlight_Toggle()
let hlstate=1
function! Highlight_Toggle()
    let g:hlstate=(g:hlstate+1) % 2
    if(g:hlstate % 2 == 0) 
        set nohlsearch 
    else
        set hlsearch 
    endif
endfunction
"==============================================

" copy & paste to system clipboard
vmap <c-c> "+y
map <c-c> "+yy
"map <c-v> "+p

" select all
map <C-a> ggVG

" moving between split windows
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l

" code setting
nmap <C-f> gg=G

" Taglist trigger: Tlist
"let Tlist_Show_One_File=1 "只显示当前文件的taglist
"let Tlist_Exit_OnlyWindow=1 "taglist最后一个窗口时退出vim
let Tlist_Use_Right_Window=1 "放置于屏幕右方
"let Tlist_Show_Menu=1 "显示菜单
"let Tlist_Auto_Open=1 "自动打开
" :TlistOpen :TlistClose

" WindowManager
" let g:AutoOpenWinManager = 1
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>

" NERD_Tree
nmap nt :NERDTreeMirror<cr>
nmap nt :NERDTreeToggle<cr>
"let NERDTreeMouseMode=2
"let NERDTreeShowLineNumbers=1
"autocmd BufRead * :NERDTreeMirror

" MinBufExplorer
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplMapWindowNavArrows=1

" Tabbar
let g:Tb_MaxSize = 3
let g:Tb_TabWrap = 1
nmap <silent> <C-PageUp> :Tbbp<CR>
nmap <silent> <C-PageDown> :Tbbn<CR>


" search in current file
nnoremap <silent> <F3> :vimgrep <cword> %<CR>
" Grep search in all files
nnoremap <silent> <F4> :Grep<CR>

" omni-completion
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
"set completeopt=longest,menu

"find ./php.5.3 -type f -name \".h" -o -name \"*.c" | xargs grep -E
"PHP_FUNCTION|ZEND_FUNCTION" | sed -ie \"s/.*_FUNCTION(//g;s/)//g" | sort |
"uniq > function.txt
"autocmd FileType php call AddPHPFuncList()

function! AddPHPFuncList()
    set dictionary-=~/.vim/tools/php/function.txt dictionary+=~/.vim/tools/php/functions.txt
    set complete-=k complete+=k
endfunction

"Neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1


" cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <F9> :cs find s <cword><cr>
nmap <F10> :cs find g <cword><cr>
nmap <F11> :cs find c <cword><cr>

" QuickFix
autocmd QuickFixCmdPre * :update
autocmd QuickFixCmdPost * :copen
nmap <C-n> :cn<cr>
nmap <C-m> :cp<cr>

" powerline: aultimate vim statusline utility
"let g:Powerline_symbols = 'fancy'
"set guifont=PowerlineSymbols\ for\ Powerline
"set nocompatible
"
" airline statusline utility
" install powerline fonts ./install.sh
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11 
set t_Co=256
let g:airline_powerline_fonts=1
"let g:airline#extensions#tabline#enabled = 1 
"let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
"let g:airline#extensions#quickfix#location_text = 'Location'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

