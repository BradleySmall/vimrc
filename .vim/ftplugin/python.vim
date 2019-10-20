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

let g:slime_target = "vimterminal"
let g:slime_vimterminal_config = {"term_name":"REPL" , "vertical" : "1"}
let g:slime_vimterminal_cmd = "python"

" let g:slime_no_mappings = 1
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeMotionSend
nmap <leader>ss <Plug>SlimeLineSend

nmap <f5> :w<cr>:SlimeSend0 "exec(open('" . expand('%:p') . "').read())\n"<CR>
imap <f5> <esc>:w<cr>:SlimeSend0 "exec(open('" . expand('%:p') . "').read())\n"<CR>
" imap <F5> <esc>:w<cr>:vert term python3 -i %<cr>
" nmap <F5> :w<cr>:term python3 -i %<cr> 
" imap <F5> <esc>:w<cr>:term python3 %<cr>
" nmap <F5> :w<cr>:term python3 %<cr> 
" imap <F5> <esc>:w<CR>:!clear;python3 %<CR>
" nmap <F5> :w<CR>:!clear;python3 %<CR>
nmap <F6> :w<CR>:!python3 % 
nmap <F7> :w<CR>:SyntasticCheck<CR>

nnoremap <space> za
vnoremap <buffer> <localleader>cc :s/^/#<cr>
vnoremap <buffer> <localleader>cu :s/^#//<cr>

" set foldmethod=indent
let python_highlight_all=1
let g:syntastic_python_checkers = ['flake8', 'frosted', 'mypy', 'pep257', 'pep8', 'prospector', 'pycodestyle', 'pydocstyle', 'pyflakes', 'pylint3', 'python3']

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

" Remove trailing whitespace 
autocmd BufWritePre *.py,*.pyw %s/\s\+$//e
