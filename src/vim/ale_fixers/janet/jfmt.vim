function! ale_fixers#janet#jfmt#Fix(buffer) abort
    return {
    \   'command': 'jfmt',
    \   'read_temporary_file': 1,
    \}
endfunction
