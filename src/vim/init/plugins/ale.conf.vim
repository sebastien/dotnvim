" We disable most pesky linters for Python
let g:ale_pattern_options = {'\.paml$':{'ale_enabled':0}}
let g:ale_linters = {
\   'python': ['mypy'],
\}
