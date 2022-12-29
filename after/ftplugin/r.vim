setlocal makeprg=R\ --no-save\ -s\ -e\ \'source(\"$*\")\'
setlocal define=^\s*\ze\i\+\s*<-\s*function(
setlocal include=^\s*source(
setlocal shiftwidth=2 tabstop=2 softtabstop=2
setlocal formatprg=formatr
setlocal errorformat=
            \%E%trror\ in\ %m,
            \%CCalls:%\\s%s,
            \%Z%.%#,
            \%+G%.%#
setlocal makeprg=R\ --no-save\ -s\ -e\ \'source(\"$*\")\'
let g:repl_config = {'r': {'cmd':'R', 'load_file' : 'source("%s")'}}
let r_syntax_fun_pattern = 1
inoremap <F3> %>%
