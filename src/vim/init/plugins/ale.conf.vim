" SEE: https://github.com/dense-analysis/ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clangtidy','uncrustify'],
\   'go': ['gofmt', 'goimports'],
\   'javascript': ['prettier', 'deno'],
\   'javascriptreact': ['prettier', 'deno'],
\   'kotlin': ['ktlint'],
\   'markdown': ['pandoc','textlint'],
\   'python': ['autopep8', 'remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'scss': ['prettier', 'stylelint'],
\   'typescript': ['deno'],
\}

let g:ale_linters = {
\   'c': ['cc', 'ccls', 'clangd', 'clangtidy', 'cppcheck', 'cquery', 'flawfinder'],
\   'css': ['prettier', 'stylelint'],
\   'go': ['gopls', 'gometalinter', 'gofmt', 'staticcheck'],
\   'javascript': ['deno'],
\   'javascriptreact': ['deno'],
\   'kotlin': ['kotlinc', 'ktlint'],
\   'python': ['mypy', 'pyre', 'pyright'],
\   'rust': ['analyzer', 'cargo', "rls', 'rustc'"],
\   'scss': ['sccslint', 'stylelint'],
\   'typescript': ['deno'],
\}

" FROM: https://github.com/dense-analysis/ale/issues/1353
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

" FROM: https://github.com/dense-analysis/ale/issues/249
let g:ale_sign_warning = '•'
let g:ale_sign_error = "➤"
