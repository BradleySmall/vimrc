" Python specific settings.
setlocal autoindent
setlocal encoding=utf-8 
setlocal expandtab
setlocal fileformat=unix 
setlocal foldlevel=99 
setlocal foldmethod=indent 
setlocal formatoptions=croql
setlocal shiftwidth=4
setlocal softtabstop=4 
setlocal tabstop=4
setlocal textwidth=79 
setlocal colorcolumn=80
syntax on

nmap <F5> :w<CR>:!clear;python3 %<CR>
nmap <F6> :w<CR>:!python3 % 
nmap <F7> :w<CR>:SyntasticCheck<CR>

nnoremap <space> za
nnoremap <buffer> <localleader>c I#

" set foldmethod=indent
let python_highlight_all=1

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

" Remove trailing whitespace 
autocmd BufWritePre *.py,*.pyw %s/\s\+$//e
