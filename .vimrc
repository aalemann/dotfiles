syntax on           "enable syntax highlightning

filetype plugin indent on   "smartindent for specific languages (like idl)

" tab related
set expandtab       "uses space characters instead of tabs
set tabstop=4       "set tabsize to 4 characters
set shiftwidth=4    "for automatic/smart indentation
set autoindent      "copy indentation from previous line
set smartindent     "automatically inserts a level of indentation in some cases

set number          "activate line numbering

set foldmethod=marker   "active fold-method via marker, default markers: {{{  }}}


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

hi StatusLine ctermbg=0 cterm=NONE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" set title of window to filename, vi is currently editing
" takes into account tabs and buffers and 
" avoids showing  thanks for flying Vim  when ending vi
if &term == "screen"
  set t_ts=k
  set t_fs=\
  auto BufEnter * :set title | let &titlestring = 'vi:' . expand('%')
  auto VimLeave * :set t_ts=k\
endif

" related to screen-vim behaviour, but might be a bad idea to use
" if match($TERM, "screen")!=-1
"    set term=xterm
"endif
