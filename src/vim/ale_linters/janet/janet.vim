" FIXME: Does not work
" function! ale_linters#janet#janet(buffer) abort
"     return 'janet -k -w strict ' . shellescape(expand('#' . a:buffer . ':p'))
" endfunction
"
" call ale#linter#Define('janet', {
" \   'name': 'janet',
" \   'executable': 'janet',
" \   'command_callback': 'ale_linters#janet#janet',
" \   'lint_file': 1,
" \})
