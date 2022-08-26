setlocal define=^\s*\ze\i\+\s*<-\s*function(
setlocal include=^\s*source(
setlocal shiftwidth=2 tabstop=2 softtabstop=2
setlocal makeprg=Rscript
setlocal formatprg=formatr
setlocal errorformat=
            \%E%trror\ in\ %m,
            \%CCalls:%\\s%s,
            \%Z%.%#,
            \%+G%.%#
