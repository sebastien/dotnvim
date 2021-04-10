
function! LinterStatus() abort
    " let l:counts = ale#statusline#Count(bufnr(''))
    " let l:all_errors = l:counts.error + l:counts.style_error
    " let l:all_non_errors = l:counts.total - l:all_errors
	" " TODO: Do we have a fixer in place?
	" " TODO: Do we have a linter in place?
    " return l:counts.total == 0 ? 'OK' : printf(
    " \   '%dW %dE %s',
    " \   all_non_errors,
    " \   all_errors
    " \)
endfunction

function! StatusFileUpdated()
  let ext=tolower(expand("%:e"))
  let fname=tolower(expand('%<'))
  let filename=fname . '.' . ext
  return strftime("%Y-%m-%dT%H:%M:%S",getftime(filename))
endfunction

" B | path/file.ext [TYPE,MOD]                                         2 13/200
set statusline=[%n]%3*█▓▒░%f░▒▓█%4*\ %5*\ %6*\ %c┄\%l/%L[%p%%]%=%(%{StatusFileUpdated()}―%{LinterStatus()}―[%Y%2*%M%R%W%*]%)

" EOF
