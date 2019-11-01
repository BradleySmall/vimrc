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
let g:slime_vimterminal_cmd = "ipython"

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

let ropevim_vim_completion=1
let ropevim_extended_complete=1
let g:ropevim_autoimport_modules = ["os", "shutil"]
setlocal omnifunc=RopeCompleteFunc
let g:ropevim_prefer_py3=1
let b:ropevim_prefer_py3=1


" set foldmethod=indent
let python_highlight_all=1
"
" Check Python files with flake8 and pylint.
let b:ale_linters = ['pyls', 'flake8', 'pylint', 'bandit', 'mypy', 'prospector', 'pycodestyle', 'pydocstyle', 'pyflakes', 'pylama', 'pyre', 'vulture']

" Fix Python files black.
let b:ale_fixers = ['black', 'isort', 'remove_trailing_lines', 'reorder-python-imports', 'trim_whitespace', 'add_blank_lines_for_python_control_statements']

" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

" Remove trailing whitespace 
autocmd BufWritePre *.py,*.pyw %s/\s\+$//e


