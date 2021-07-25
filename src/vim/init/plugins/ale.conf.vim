" SEE: https://github.com/dense-analysis/ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'deno'],
\   'javascriptreact': ['prettier', 'deno'],
\   'typescript': ['deno'],
\   'scss': ['prettier', 'stylelint'],
\   'python': ['autopep8', 'remove_trailing_lines', 'trim_whitespace'],
\   'go': ['gofmt', 'goimports'],
\   'kotlin': ['ktlint'],
\   'rust': ['rustfmt'],
\   'c': ['clangtidy','uncrustify'],
\}

let g:ale_linters = {
\   'javascript': ['deno'],
\   'javascriptreact': ['deno'],
\   'typescript': ['deno'],
\   'css': ['prettier', 'stylelint'],
\   'python': ['mypy'],
\   'scss': ['sccslint', 'stylelint'],
\   'go': ['gopls', 'gometalinter', 'gofmt', 'staticcheck'],
\   'kotlin': ['kotlinc', 'ktlint'],
\   'rust': ['analyzer', 'cargo', "rls', 'rustc'"],
\   'c': ['cc', 'ccls', 'clangd', 'clangtidy', 'cppcheck', 'cquery', 'flawfinder'],
\}

" FROM: https://github.com/dense-analysis/ale/issues/1353
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"
