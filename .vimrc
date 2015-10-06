syntax on           "enable syntax highlightning

filetype plugin indent on   "smartindent for specific languages (like idl)

set expandtab       "uses space characters instead of tabs
set tabstop=4       "set tabsize to 4 characters
set shiftwidth=4    "for automatic/smart indentation

set autoindent      "copy indentation from previous line
set smartindent     "automatically inserts a level of indentation in some cases

set number          "activate line numbering

set foldmethod=marker   "active fold-method via marker, default markers: {{{  }}}

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
