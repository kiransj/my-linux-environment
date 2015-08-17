set nocompatible    	" Use Vim defaults (much better!)
filetype plugin on
filetype on
syntax enable
syntax on
set smartindent
set showcmd
set encoding=utf-8
set expandtab
set sw=4                " shift with
set ts=4                " tab stop
set sts=4               " tab stop
set cindent
set wildmenu
set sm                  " show match
set ic                  " ignore case
set smartcase
set is                  " highlight match while typing search pattern
set hlsearch            " highlight the search
set incsearch           " show matches while searching
set number              " line number display
set nowrap              " disables word-wrap
set ru                  " show cursor line and column in the status line
set bs=2		        " allow backspacing over everything in insert mode
set ai			        " always set autoindenting on
set mh                  " hide mouse pointer while typing
set backup		        " keep a backup file
set noerrorbells        " stop beeping!
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than 50 lines of registers
set mouse=a
set wildmode=full
set autowrite
set hid					" Toggle between files without saving
set nobackup
set nowritebackup
set laststatus=2        " shows the status bar at all time

"avoid w11 warnings when opening process outputs
"set autoread
set backupdir=~/.tmp
set directory=~/.tmp

set wildignore=.svn,.o,*.so,*.swp
colorscheme evening

let Tlist_Show_One_File=1

"command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
 
if has('cscope')
    set cscopetag cscopeverbose

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif
    set cspc=3
    set cscopeverbose
    noremap <C-y> :cs f c <cword><CR> 
    if findfile("cscope.out", ".") == "cscope.out"
        :cs add cscope.out
    endif        
endif   

function! ToggleModifiable()
    let cur_buf = bufname('%')
    if getbufvar(cur_buf, '&modifiable')

        "make the buffer not modifiable        
        set noma
        echo "Editing off"
    else

        "make the buffer modifiable
        set ma         
        echo "Editing on"
     endif
endfunction    

nmap <F1>  :bn<CR>
nmap <F2>  :bN<CR>
nmap <F3>  :b #<CR>
nmap <F4>  :bd<CR>
"nmap <F5> will mapped below for clang
nmap <F6>  :SrcExplToggle<CR>
nmap <F8>  :call ToggleModifiable()<CR>
nmap <F9>  :TlistToggle<CR>
nmap <F10> :call QFixToggle(0)<CR>
nmap <F11> :cn<CR>
nmap <F12> :cN<CR>

set diffopt+=iwhite

let MRU_Max_Entries = 50
let MRU_Include_Files = '\.c$\|\.h$'

let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_searchLocalDefs = 1
let g:SrcExpl_pluginList = [ "__Tag_List__", "Source_Explorer" ]

"for autopop don't ignore case
let g:acp_ignorecaseOption = 1
let g:acp_completeoptPreview = 1
let g:acp_behaviorKeywordLength = 3

"My Cmds
"
"This function open a file using cscope db
function! OpenFile(arg) "{{{
    exe 'cs f f ' . a:arg
endfunction "}}}
command! -nargs=* OpenFile call OpenFile( '<args>' )

"Integreate gtags with functions

"Excute the cmd and load the results
function! Gtags_exe(arg)
    let l:cmd = a:arg    
    let l:result = system(l:cmd)
    if l:result == ''
        echo "Tag not found"
    else
        copen 10  "open windows with 10 lines
        let l:efm_org = &efm
        let &efm = "%f:%l:%m"
        cexpr! l:result
        let &efm = l:efm_org
        let g:qfix_win = bufnr("$")
    endif
endfunction    

function! GPattern(arg)
    let l:cmd = 'global --result=grep -g ' . a:arg 
    call Gtags_exe(l:cmd)
endfunction 
command! -nargs=* GPattern call GPattern( '<args>' )

function! GSymbol()
    let l:cmd = 'global --result=grep --from-here='. line(".") . ':' . expand("%:p") . ' ' . expand("<cword>")
    call Gtags_exe(l:cmd)
endfunction
command! -nargs=* GSymbol call GSymbol()

function! SetT()
    :cs add ~/build/cscope.out  
    :set tags=~/build/tags
endfunction
command! -nargs=* SetT call SetT()

au BufNewFile,BufRead *.log set filetype=log

set tabstop=8
set runtimepath^=~/.vim/bundle/node
