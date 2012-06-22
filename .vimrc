" ~/.vimrc (configuration file for vim only)
" skeletons -------------------------------------------{{{
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
" }}}

" filetypes -------------------------------{{{
filetype plugin on
filetype indent on
" }}}

" Configuration settings ------------------{{{
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup		" keep a backup file
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set tabstop=4
set shiftwidth=4
set number
set autowrite
set autoindent		" always set autoindenting on

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

color darkblue

" start with file modification status
set statusline=%m
" then file name/path
set statusline+=%f
" some separation and the file type
set statusline+=\ -\ FileType:\ %y
" switch to the right side
set statusline+=%=
" put the current line
set statusline+=%l
" put the column and virtual colum prefaced by a comma
set statusline+=,%c%V
" followed by a slash and the total lines in the file
set statusline+=/%L
" }}}

" Leader settings ------------------------{{{
let mapleader = "\\"
let maplocalleader = "\\"
" }}}

" Convenience Mappings ----------------------{{{
" swap lines down
nnoremap <leader>- ddpk
" swap lines up
nnoremap <leader>_ ddkPj

" edit the _vimrc file in a split
nnoremap <leader>ev :split $MYVIMRC<cr>
" reread (source) the current _vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" enclose in quote or single quotes -------------------{{{
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
" }}}

" replacement for ESC key -----------------------------{{{
inoremap kj <esc>
inoremap jk <esc>
" }}}

" new HOME and END keys --------------------------------{{{
nnoremap L $
nnoremap H ^
" }}}

" NEXT and LAST around and inside movements ----------------------{{{
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
"onoremap in@ :<c-u>normal! f@?[^a-zA-Z0-9!#$%&'*+-/=?^_`{|}~.]vf@/[^a-zA-Z0-9!#$%&'*+-/=?^_`{|}~.]<cr>
onoremap in@ :<c-u>execute "normal! :nohlsearch\r/[a-zA-Z0-9_.]\\+@[a-zA-Z0-9_.]\\+\r:nohlsearch\rv/[^a-zA-Z0-9_.@]\r"<cr>
" }}}

" Vimscript file settings ---------------------------{{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim     nnoremap <buffer> <localleader>c I"
	autocmd FileType vim setlocal foldmethod=marker	
	autocmd FileType vim setlocal nowrap
	autocmd FileType vim setlocal foldlevelstart=0
augroup END
" }}}

" Python file settings ------------------------------{{{
augroup filetype_python
	autocmd FileType python     nnoremap <buffer> <localleader>c I#
augroup END
" }}}

" CPP file settings ---------------------------------{{{
augroup filetype_cpp
	autocmd!
	autocmd FileType cpp nnoremap <buffer> <localleader>c I//
	autocmd FileType cpp vnoremap <buffer> <localleader>c I//
	autocmd fileType cpp nnoremap <buffer> <localleader>/ I/*<esc>A*/<esc>j^
	autocmd fileType cpp vnoremap <buffer> <localleader>/ <esc>`>a*/<esc>`<i/*<esc>
	autocmd fileType cpp nnoremap <buffer> <localleader>" viw<esc>a"<esc>hbi"<esc>lel
	autocmd fileType cpp nnoremap <buffer> <localleader>' viw<esc>a'<esc>hbi'<esc>lel
	autocmd fileType cpp vnoremap <buffer> <localleader>" <esc>`>a"<esc>`<i"<esc>
	autocmd fileType cpp vnoremap <buffer> <localleader>' <esc>`>a'<esc>`<i'<esc>
augroup END
" }}}

" Javascript file settings ---------------------------{{{
augroup filetype_javascript
	autocmd FileType javascript nnoremap <buffer> <localleader>c I//
augroup END
" }}}

" Html file settings ---------------------------------{{{
augroup filetype_html
	autocmd!
	autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
	autocmd BufWrite *.html :normal gg=G
	autocmd BufWrite,BufRead *.html setlocal nowrap
augroup END
" }}}

" Spec file settings ---------------------------------{{{
augroup FileType_spec
	autocmd BufNewFile	*.spec	call SKEL_spec()
augroup END
" }}}

" Pathogen settings ----------------------------------------------------{{{
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"}}}

" Extra Terminal Stuff ----------------------------- {{{
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
" }}}

" vimrcEx ------------------------------------------------------{{{
" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
			  \ if line("'\"") > 1 && line("'\"") <= line("$") |
			  \   exe "normal! g`\"" |
			  \ endif

augroup END
" }}}

" DiffOrig -------------------------------------- {{{
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
" }}}

" MyDiff ----------------------------------------------------------{{{
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif

  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"}}}

" NEXT and LAST around and inside movements ----------------------{{{
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
"onoremap in@ :<c-u>normal! f@?[^a-zA-Z0-9!#$%&'*+-/=?^_`{|}~.]vf@/[^a-zA-Z0-9!#$%&'*+-/=?^_`{|}~.]<cr>
onoremap in@ :<c-u>execute "normal! :nohlsearch\r/[a-zA-Z0-9_.]\\+@[a-zA-Z0-9_.]\\+\r:nohlsearch\rv/[^a-zA-Z0-9_.@]\r"<cr>
" }}}


" ~/.vimrc ends here
