" SEE: https://github.com/dense-analysis/ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'scss': ['prettier', 'stylelint'],
\   'python': ['autopep8', 'autoimport'],
\   'go': ['gofmt', 'goimports'],
\   'kotlin': ['ktlint'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['mypy'],
\   'scss': ['sccslint', 'stylelint'],
\   'go': ['gopls', 'gometalinter', 'gofmt', 'staticcheck'],
\   'kotlin': ['kotlinc', 'ktlint'],
\}

" FROM: https://github.com/dense-analysis/ale/issues/1353
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"
