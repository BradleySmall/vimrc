" ~/.vimrc (configuration file for vim only){{{
"
" Plugged Plugins --- {{{
call plug#begin('~/.vim/plugged')
"
" Plug 'dense-analysis/ale'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
"       test for plugin loaded 
" has_key(plugs, 'vim-surround')
" has_key(plugs, 'fugitive-gitlab.vim')
" has_key(plugs, 'nerdtree-git-plugin')
" has_key(plugs, 'nerdtree')
" has_key(plugs, 'vim-solarized8')
" has_key(plugs, 'vim-slime')
" has_key(plugs, 'vim-orgmode')
" has_key(plugs, 'vim-rhubarb')
" has_key(plugs, 'vim-fugitive')
" has_key(plugs, 'loremipsum')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ? did_coc_loaded
Plug 'jpalardy/vim-slime'
" loaded_slime
Plug 'tpope/vim-fugitive'
" loaded_fugitive
Plug 'shumphrey/fugitive-gitlab.vim'
" loaded_fugitive_gitlab
Plug 'tpope/vim-rhubarb'
" loaded_rhubarb
Plug 'vim-scripts/loremipsum'
" loaded_loremipsum
Plug 'tpope/vim-surround'
" loaded_surround
Plug 'lifepillar/vim-solarized8'

" Plug 'scrooloose/nerdtree'
" loaded_nerd_tree
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jceb/vim-orgmode'
" Plug 'tmhedberg/SimpylFold'
" Plug 'vimwiki/vimwiki'
" Plug 'python-rope/ropemode'
Plug 'python-rope/ropevim'
" Plug 'davidhalter/jedi-vim'
" Plug 'jacoborus/tender.vim'
" Plug 'tpope/vim-vividchalk'
" Plug 'natebosch/vim-lsc'
Plug 'janko/vim-test'
" has_key(plugs, 'vim-test')
Plug '5long/pytest-vim-compiler'
Plug 'reinh/vim-makegreen'
call plug#end()

" }}}

" Configuration settings --- {{{
"
" allow backspacing over everything in insert mode
set autoindent      " always set autoindenting on
set autowrite
set backspace=indent,eol,start
set cindent
set expandtab
set guifont=DejaVu\ Sans\ Mono\ 12
set history=50      " keep 50 lines of command line history
set hlsearch
set incsearch       " do incremental searching
set number
set relativenumber
set ruler           " show the cursor position all the time
set shiftwidth=4
set showcmd         " display incomplete commands
set smartindent
set softtabstop=4
set tabstop=4
set termguicolors
set wrap!
" set list listchars=tab:»»,trail:•,precedes:←,extends:→,space:·,eol:¶
set list listchars=tab:»»,trail:•,precedes:←,extends:→,space:\ ,eol:¶
set clipboard=unnamedplus,unnamed

filetype plugin on
filetype indent on

syntax on
syntax enable
" }}}

" -----------------------------------------------------------------{{{
" Solarized8 Colorscheme Config
" ------------------------------------------------------------------
" --- solarized8 --- {{{
if has_key(plugs, 'vim-solarized8')
colorscheme solarized8_high
let g:solarized_diffmode = "high"
let g:solarized_enable_extra_hi_groups = 0
let g:solarized_italics = 1
let g:solarized_old_cursor_style = 0
let g:solarized_statusline = "normal"
let g:solarized_termtrans = 0
let g:solarized_visibility = "normal"

if has('gui_running')
    set background=dark
else
    set background=dark
endif

function! TogBG()
    if (&background=='dark')
        set background=light
    else
        set background=dark
    endif
endfunction

command TogBG call TogBG()

if &diff
    set background=light
    if has('syntax')
        set nocursorline
        syntax off
    endif
    set norelativenumber
    augroup VimrcVimdiff
        autocmd!
        autocmd VimResized * wincmd =
    augroup END
endif
endif
" }}}
" }}}

" swap file stuff --------------------------------------------------{{{
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif
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

" Leader settings ------------------------{{{
let mapleader = "\\"
let maplocalleader = "\\"
" }}}

" Q setting ------------------------------------ {{{
" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" }}}

" commands to endit vim settings ------ {{{ 
" edit the _vimrc file in a split
nnoremap <leader>ev :split $MYVIMRC<cr>
" edit the _ftplugin/python.vim fileMYVIMRC in a split
nnoremap <leader>ep :split $HOME/.vim/ftplugin/python.vim<cr>
" reread (source) the current _vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
"change directory to that of current file
" }}}

" change to the current working dir of the file ------{{{
nnoremap <leader>cd :cd %:p:h<CR>
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

" Status line  --------------{{{
" start with file modification status
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
" set statusline=%m
" " then file name/path
" set statusline+=%f
" " some separation and the file type
" set statusline+=\ -\ FileType:\ %y
" " switch to the right side
" set statusline+=%=
" " put the current line
" set statusline+=%l
" " put the column and virtual colum prefaced by a comma
" set statusline+=,%c%V
" " followed by a slash and the total lines in the file
" set statusline+=/%L
" }}}

" netrw settings -------------------------{{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

autocmd FileType netrw setl bufhidden=delete
nnoremap <F2> :Vexplore<CR>
" }}}

" shell settings =========================={{{
"bms   if has ( "win32unix" ) 	
"bms       set shell=/bin/bash
"bms       set shellcmdflag=--login\ -c
"bms   elseif has ( "unix" )
"bms       set shell=/bin/bash
"bms       set shellcmdflag=--login\ -c
"bms       set path=.,,/usr/include,./inc,../inc,./include,../include,~/include,inc,include
"bms   else
"bms       set shell=cmd.exe
"bms   endif
	"#set shellxquote=\"
"}}}

" skeletons -------------------------------------------{{{
"     function! SKEL_spec()
"     	0r /usr/share/vim/current/skeletons/skeleton.spec
"     	language time en_US
"     	if $USER != ''
"     	    let login = $USER
"     	elseif $LOGNAME != ''
"     	    let login = $LOGNAME
"     	else
"     	    let login = 'unknown'
"     	endif
"     	let newline = stridx(login, "\n")
"     	if newline != -1
"     	    let login = strpart(login, 0, newline)
"     	endif
"     	if $HOSTNAME != ''
"     	    let hostname = $HOSTNAME
"     	else
"     	    let hostname = system('hostname -f')
"     	    if v:shell_error
"     		let hostname = 'localhost'
"     	    endif
"     	endif
"     	let newline = stridx(hostname, "\n")
"     	if newline != -1
"     	    let hostname = strpart(hostname, 0, newline)
"     	endif
"     	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
"     	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
"     	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
"     	setf spec
"     endfunction
" }}}

" Vimscript file settings ---------------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim nnoremap <buffer> <localleader>c I"
    autocmd FileType vim setlocal foldmethod=marker	
    autocmd FileType vim setlocal nowrap
    autocmd FileType vim setlocal foldlevelstart=0
augroup END
" }}}

" Python file settings ------------------------------{{{
augroup filetype_python
    setlocal omnifunc=pythoncomplete#Complete
    autocmd BufNewFile *.py 0r ~/.vim/skel/py.skel
augroup END
" }}}

" C file settings ---------------------------------{{{
augroup filetype_c
    autocmd!
    autocmd Filetype c setlocal textwidth=80
    autocmd Filetype c setlocal colorcolumn=80
    autocmd FileType c nnoremap <buffer> <localleader>c I//
    autocmd FileType c vnoremap <buffer> <localleader>c I//
    autocmd fileType c nnoremap <buffer> <localleader>/ I/*<esc>A*/<esc>j^
    autocmd fileType c vnoremap <buffer> <localleader>/ <esc>`>a*/<esc>`<i/*<esc>
    autocmd fileType c nnoremap <buffer> <localleader>" viw<esc>a"<esc>hbi"<esc>lel
    autocmd fileType c nnoremap <buffer> <localleader>' viw<esc>a'<esc>hbi'<esc>lel
    autocmd fileType c vnoremap <buffer> <localleader>" <esc>`>a"<esc>`<i"<esc>
    autocmd fileType c vnoremap <buffer> <localleader>' <esc>`>a'<esc>`<i'<esc>
    autocmd FileType c nnoremap <buffer> [[ ?{<CR>w99[{
    autocmd FileType c nnoremap <buffer> ][ /}<CR>b99]}
    autocmd FileType c nnoremap <buffer> ]] j0[[%/{<CR>
    autocmd FileType c nnoremap <buffer> [] k$][%?}<CR>
    autocmd BufNewFile *.c 0r ~/.vim/skel/c.skel
augroup END
" }}}

" CPP file settings ---------------------------------{{{
augroup filetype_cpp
    autocmd!
    autocmd Filetype cpp setlocal textwidth=80
    autocmd Filetype cpp setlocal colorcolumn=80
    autocmd FileType cpp nnoremap <buffer> <localleader>c I//
    autocmd FileType cpp vnoremap <buffer> <localleader>c I//
    autocmd fileType cpp nnoremap <buffer> <localleader>/ I/*<esc>A*/<esc>j^
    autocmd fileType cpp vnoremap <buffer> <localleader>/ <esc>`>a*/<esc>`<i/*<esc>
    autocmd fileType cpp nnoremap <buffer> <localleader>" viw<esc>a"<esc>hbi"<esc>lel
    autocmd fileType cpp nnoremap <buffer> <localleader>' viw<esc>a'<esc>hbi'<esc>lel
    autocmd fileType cpp vnoremap <buffer> <localleader>" <esc>`>a"<esc>`<i"<esc>
    autocmd fileType cpp vnoremap <buffer> <localleader>' <esc>`>a'<esc>`<i'<esc>
    autocmd FileType cpp nnoremap <buffer> [[ ?{<CR>w99[{
    autocmd FileType cpp nnoremap <buffer> ][ /}<CR>b99]}
    autocmd FileType cpp nnoremap <buffer> ]] j0[[%/{<CR>
    autocmd FileType cpp nnoremap <buffer> [] k$][%?}<CR>
    autocmd BufNewFile *.cpp 0r ~/.vim/skel/cpp.skel
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

" XML file settings ----------------------------------{{{
augroup XML
    autocmd!
    autocmd FileType xml let g:xml_syntax_folding=1
    autocmd FileType xml setlocal foldmethod=syntax
    autocmd FileType xml :syntax on
    autocmd FileType xml :%foldopen!
augroup END
" }}}

" Json file settings ---------------------------------{{{
" augroup filetype_json
"    autocmd!
"    autocmd BufRead,BufNewFile *.json set filetype=json foldmethod=syntax
"    autocmd Syntax json source $HOME/.vim/syntax/json.vim
" augroup END
"au FileType json command -range=% -nargs=* Tidy <line1>,<line2>! json_xs -f json -t json-pretty
"}}}

" Spec file settings ---------------------------------{{{
"     augroup FileType_spec
"     	autocmd BufNewFile	*.spec	call SKEL_spec()
"     augroup END
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

" sudo writing -------------------------------------------------{{{
cmap w!! w !sudo tee % > /dev/null 
"}}}

" tabs shortcuts --------------------------------------------{{{
"custom shortcuts
"tabs
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>
" nnoremap <C-t> :tabnew<CR>
" inoremap <C-Left> <Esc> :tabprevious<CR>i
" inoremap <C-Right><Esc> :tabnext<CR>i
" inoremap <C-t> <Esc> :tabnew<CR>
" }}}
"
" Ctags stuff ----------------------------------------------------------{{{
set tags+=.tags;/
" BMS set tags=./tags;$HOME
" BMS set tags+=~/.vim/tags/libc6-dev_tags
" BMS set tags+=~/.vim/tags/cpp_tags
" BMS set tags+=~/.vim/tags/cpp
function! UpdateTags()
  execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
  echohl StatusLine | echo "C/C++ tag updated" | echohl None
endfunction
nnoremap <F8> :call UpdateTags()
"}}}

" Fugitive gitlab setting --------------------------------- {{{
let g:fugitive_gitlab_domains = ['https://git.qoto.org']

" Use vimdiff as merge tool
"     git mergetool
" git config merge.tool vimdiff
" git config merge.conflictstyle diff3
" git config mergetool.prompt false
" }}}

source  /usr/share/vim/vim81/ftplugin/man.vim
