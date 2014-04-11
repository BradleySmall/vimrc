" vim compiler file
" Compiler:		cppcheck (C++ static checker)
" Maintainer:   Vincent B. (twinside@free.fr)
" Last Change:  2010 mars 14

if exists("cppcheck")
  finish
endif
let current_compiler = "cppcheck"

let s:cpo_save = &cpo
set cpo-=C

setlocal makeprg=/usr/bin/cppcheck\ --enable=all\ --inline-suppr\ --inconclusive\ --std=c11\ --std=c++11\ --std=posix\ --force\ --platform=unix64\ --template='{file}:{line};{severity};{id};{message}'\ -q\ .
setlocal errorformat=%f:%l;%m

let &cpo = s:cpo_save
unlet s:cpo_save

"vim: ft=vim

