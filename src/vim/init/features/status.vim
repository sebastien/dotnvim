" B | path/file.ext [TYPE,MOD]                                         2 13/200
set statusline=[%n]%3*█▓▒░%f░▒▓█%4*\ %5*\ %6*\ %c┄\%l/%L[%p%%]%=%(%{StatusFileUpdated()}―[%Y%2*%M%R%W%*]%)

function! StatusFileUpdated()
  let ext=tolower(expand("%:e"))
  let fname=tolower(expand('%<'))
  let filename=fname . '.' . ext
  return strftime("%Y-%m-%dT%H:%M:%S",getftime(filename))
endfunction
" EOF
