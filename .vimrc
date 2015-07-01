" basic setting
syntax enable
syntax on
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set nu
set mouse=v

" leader -> space key
let mapleader=" "

" ==== highlight search toggle ==============
nnoremap <expr> <leader>h Highlight_Toggle()
let hlstate=0
function Highlight_Toggle()
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
map <c-v> "+p

" select all
map <C-a> ggVG

" code setting
nmap <leader>f gg=G

" Taglist trigger: Tlist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" WindowManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

" MinBufExplorer
let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplMapWindowNavArrows=1

" search in current file
nnoremap <silent> <F3> :vimgrep <cword> % <bar> cw<CR>
" Grep search in all files
nnoremap <silent> <F4> :Grep<CR>

" omni-completion
filetype plugin indent on
set completeopt=longest,menu

" QuickFix
"nmap <F6> :cn<cr>
"nmap <F7> :cp<cr>
