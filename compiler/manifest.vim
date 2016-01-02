" Vim compiler file
" Compiler: xmllint
" Maintainer: Doug Kearns <dougkearns@gmail.com>
" Last Change:  2016 Jan 2

if exists("current_compiler")
  finish
endif
let current_compiler = "AndroidXMLManifest"

if exists(":CompilerSet") != 2    " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

exec 'CompilerSet makeprg=xmllint\ --valid\ --noout\ --relaxng "' . g:AndroidXMLCompilerDirectory . '/manifest.rng"'

CompilerSet errorformat=%+E%f:%l:\ %.%#\ error\ :\ %m,
        \%+W%f:%l:\ %.%#\ warning\ :\ %m,
        \%-Z%p^,
        \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
