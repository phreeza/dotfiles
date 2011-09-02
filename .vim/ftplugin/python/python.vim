setlocal shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=80
let python_highlight_all=1


" run scripts with F5, QBASIC style
nmap <F5> :w <CR> :!clear; python % <CR>

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
