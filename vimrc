syntax on
set autoindent


set ruler
set textwidth=0
set formatoptions+=t


" allow backspacing over autoindent, over line breaks, and over the start of insert
set backspace=indent,eol,start


" LF or CRLF
set fileformat=unix


" remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e


" put new buffer/window on the right hand side
" :vsplit
set splitright
