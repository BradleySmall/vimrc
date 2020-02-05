" Python specific settings.
" --- Config ---{{{
setlocal colorcolumn=80
setlocal encoding=utf-8 
setlocal fileformat=unix 
setlocal foldlevel=99 
setlocal foldmethod=indent 
setlocal formatoptions=croql
setlocal textwidth=79 
nnoremap <space> za
vnoremap <buffer> <localleader>cc :s/^/#<cr>
vnoremap <buffer> <localleader>cu :s/^#//<cr>
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
" }}}

" --- Coc recomended settings --- {{{
" if hidden is not set, TextEdit might fail.
if has_key(plugs,'coc.nvim')
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
endif
" }}}

"--- vim-slime --- {{{
if has_key(plugs,'vim-slime')
let g:slime_target = "vimterminal"
let g:slime_vimterminal_config = {"term_name":"REPL" , "vertical" : "1"}
let g:slime_vimterminal_cmd = "ipython"
let g:slime_python_ipython = 1

" let g:slime_no_mappings = 1
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeMotionSend
nmap <leader>ss <Plug>SlimeLineSend

nmap <f5> :w<cr>:SlimeSend0 "exec(open('" . expand('%:p') . "').read())\n"<CR>
imap <f5> <esc>:w<cr>:SlimeSend0 "exec(open('" . expand('%:p') . "').read())\n"<CR>
nmap <s-f5> :%SlimeSend<CR>
imap <s-f5> <c-o>:%SlimeSend<CR>
" imap <F5> <esc>:w<cr>:vert term python3 -i %<cr>
" nmap <F5> :w<cr>:term python3 -i %<cr> 
" imap <F5> <esc>:w<cr>:term python3 %<cr>
" nmap <F5> :w<cr>:term python3 %<cr> 
" imap <F5> <esc>:w<CR>:!clear;python3 %<CR>
" nmap <F5> :w<CR>:!clear;python3 %<CR>
" nmap <F6> :w<CR>:!python3 % 
endif
" }}}

"--- Rope --- {{{
if has_key(plugs, 'ropevim')
let g:ropevim_autoimport_modules = ["os", "shutil"]
let g:ropevim_guess_project = 1
let g:ropevim_goto_def_newwin = 'vnew'
" let ropevim_vim_completion=1
" let ropevim_extended_complete=1
" setlocal omnifunc=RopeCompleteFunc
let g:ropevim_prefer_py3=1
let b:ropevim_prefer_py3=1
endif
" }}}

" --- Pyls --- {{{
" if executable('pyls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ })
" endif
" }}}

" --- vim-lsc --- {{{
if has_key(plugs, 'vim-lsc')
"     lsc   let g:lsc_server_commands = {
"     lsc    \  'python': {
"     lsc    \    'command': 'pyls',
"     lsc    \    'log_level': -1,
"     lsc    \    'suppress_stderr': v:true,
"     lsc    \  }
"     lsc    \}
"     lsc   let g:lsc_auto_map = {
"     lsc    \  'GoToDefinition': 'gd',
"     lsc    \  'FindReferences': 'gr',
"     lsc    \  'Rename': 'gR',
"     lsc    \  'ShowHover': 'K',
"     lsc    \  'Completion': 'omnifunc',
"     lsc    \}
"     lsc   let g:lsc_enable_autocomplete  = v:true
"     lsc   let g:lsc_enable_diagnostics   = v:false
"     lsc   let g:lsc_reference_highlights = v:false
"     lsc   let g:lsc_trace_level          = 'off'
endif
" }}}

" --- ALE --- {{{
if has_key(plugs,'ale')
" " Check Python files with flake8 and pylint.
" let b:ale_linters = ['pyls', 'flake8', 'pylint', 'pycodestyle', 'pydocstyle', 'bandit', 'mypy', 'prospector', 'pyflakes', 'pylama', 'pyre', 'vulture']
" 
" " Fix Python files black.
" let b:ale_fixers = ['black', 'isort', 'remove_trailing_lines', 'reorder-python-imports', 'trim_whitespace', 'add_blank_lines_for_python_control_statements']
" 
" " Disable warnings about trailing whitespace for Python files.
" let b:ale_warn_about_trailing_whitespace = 0
endif
" }}}

" --- Vim Test --- {{{
if has_key(plugs, 'vim-test')
    " these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
    nmap <silent> t<C-n> :TestNearest<CR>
    nmap <silent> t<C-f> :TestFile<CR>
    nmap <silent> t<C-s> :TestSuite<CR>
    nmap <silent> t<C-l> :TestLast<CR>
    nmap <silent> t<C-g> :TestVisit<CR>
endif 
" }}}
"
