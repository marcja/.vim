": Title        : closure
": Author       : "Marc Jacobs" <vim.git@marcja.com>
": Description  : Defines a makeprg for the Closure Compiler
": Options      : None

if exists("current_compiler")
  finish
endif

let current_compiler = "closure"

if exists(":CompilerSet") != 2
  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=java\ -jar\ $HOME/bin/closure/compiler.jar\ --js_output_file=%<.min.js\ --js\ %
CompilerSet errorformat=%E%f:%l:\ %m,%-Z%p^,%-C%.%#,%-G%.%#
