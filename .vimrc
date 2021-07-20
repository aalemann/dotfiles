" use vim-options and disable vi-behaviour; is not set, cool stuff won't work
" if only system-wide .vimrc exists, this would not be set off by default
" if explicitly loading a .vimrc with vim -u test_vimrc this is not off by default
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set Vundle environement
" install Vundle via
" $ git clone https://github.com/gmarik/Vundle.vim.git \
"   ~/.vim/bundle/Vundle.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                "required

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" add plugins here (github-name/projectname)
Plugin 'scrooloose/nerdtree'

" allows to toggle bool and a few other words with shortcut, script_id=895
Plugin 'Toggle'

call vundle#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on                   "enable syntax highlightning


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" handle tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on   "smartindent for specific languages (like idl)
set expandtab               "uses space characters instead of tabs
set tabstop=4               "set tabsize to 4 characters
set shiftwidth=4            "for automatic/smart indentation
set autoindent              "copy indentation from previous line
set smartindent             "automatically inserts a level of indentation in some cases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number                  "activate line numbering

set foldmethod=marker   "active fold-method via marker, default markers: {{{  }}}


set incsearch       "searching already while typing 
set hlsearch        "highlight matching strings

"clear highlighting when going into insert mode
autocmd InsertEnter * :set nohlsearch
autocmd InsertLeave * :set hlsearch

"clear highlighting by hitting <enter>
nnoremap <CR> :nohlsearch<CR><CR> 
"note, when using <esc> for this, 2 lines are required:
"nnoremap <esc> :noh<return><esc>
"nnoremap <esc>^[ <esc>^[

set history=1000        "increase size of history (default is usually 50))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set statusbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%F           "full path to file
set statusline+=%m          "modified flag [+]
set statusline+=%r          "read-only flag [RO]
set statusline+=%h          "help flag [Help]
set statusline+=%w          "preview window flag (?)
set statusline+=\           "separator
set statusline+=%=          "right alignment
set statusline+=[%{&ff}]    "format of file (dos, unix)
set statusline+=\           "separator
set statusline+=%y          "file type as recognized by vim
set statusline+=\           "separator
set statusline+=%3v,        "position of cursor: line (%05l would also work)
set statusline+=%l/%L       "position of cursor: line/total number of lines
set statusline+=\           "separator
set statusline+=\           "separator
set statusline+=%p%%        "position of cursor: percentage of total file
set statusline+=\           "separator

set laststatus=2            "status line is 2nd last line in editor

hi StatusLine ctermbg=Grey cterm=NONE  "0 is black
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change appearance of tabline to include numbers
" source: https://superuser.com/a/614424
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabline=%!MyTabLine()   " custom tab pages line
function MyTabLine()
    let s = ''              " complete tabline goes here
    " loop through each tab page
    for t in range(tabpagenr('$'))
        " set highlight
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        
        " set the tab page number (for mouse clicks)
        let s .= '%' . (t + 1) . 'T'
        let s .= ' '
        
        " set page number string
        let s .= t + 1 . ' '
        
        " get buffer names and statuses
        let n = ''          " temp string for buffer names while we loop and check buftype
        let m = 0           " &modified counter
        let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
        
        " loop through each buffer in a tab
        for b in tabpagebuflist(t + 1)
            " buffer types: quickfix gets a [Q], help gets [H]{base fname}
            " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
            if getbufvar( b, "&buftype" ) == 'help'
                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
            elseif getbufvar( b, "&buftype" ) == 'quickfix'
                let n .= '[Q]'
            else
                let n .= pathshorten(bufname(b))
            endif
            " check and ++ tab's &modified count
            if getbufvar( b, "&modified" )
                let m += 1
            endif
            " no final ' ' added...formatting looks better done later
            if bc > 1
                let n .= ' '
            endif
            let bc -= 1
        endfor
        
        " add modified label [n+] where n pages in tab are modified
        if m > 0
            " let s .= '[' . m . '+]'
            let s .= '[+]'
        endif
        
        " select the highlighting for the buffer names
        " my default highlighting only underlines the active tab
        " buffer names.
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " add buffer names
        if n == ''
            let s.= '[New]'
        else
            let s .= n
        endif
        " switch to no underlining and add final space to buffer list
        let s .= ' '
    endfor
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
            let s .= '%=%#TabLineFill#%999Xclose'
    endif
    return s
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tell vim to store swap-files all in one place
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" check if folder exists and eventually create it
if !isdirectory( $HOME.'/.vim/swapfiles')
    call mkdir ( $HOME.'/.vim/swapfiles', 'p' )
    "silent !mkdir -p $HOME/.vim/test
endif
" set swap files to be in one place
:set directory=$HOME/.vim/swapfiles//
""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" set title of window to filename, vi is currently editing
" takes into account tabs and buffers and 
" avoids showing  thanks for flying Vim  when ending vi
" note:  is an escape character, enter with: CTRL+V <Esc>
"       t_ts --> window title start
"       t_fs --> window title end
if &term == "screen"
  set t_ts=k
  set t_fs=\
  auto BufEnter * :set title | let &titlestring = 'vi:' . expand('%')
"  auto VimLeave * :set t_ts=k\
  let &titleold=substitute(getcwd(), $HOME, "~", "")
endif


" related to screen-vim behaviour, but might be a bad idea to use
" if match($TERM, "screen")!=-1
"    set term=xterm
"endif

" swapping
" swap current character under the cursor with the next
nnoremap <silent> gc xph
" swap the current word under the cursor with the next
" also works across new-lines
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>:noh<CR>
