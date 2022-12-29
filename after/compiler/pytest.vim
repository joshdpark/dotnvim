if exists('current_compiler')
  finish
endif
let current_compiler = 'pytest'

if exists(':CompilerSet') != 2  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pytest\ -s
CompilerSet errorformat=
            \%E%*[_]\ %o\ %*[_],
            \%Z%f:%l:%m,
            \%CE%*[\ ]%m,
            \%C%.%#,
            " \%C\ %.%#,
            " \%C>%.%#,
            " start multiline error message %E with ___ %module ___
            " end multiline if %file:%line%: %message
            " continue if start with E
            " continue if start with >
            " continue 
