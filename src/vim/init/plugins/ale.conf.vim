" SEE: https://github.com/dense-analysis/ale
" npm i -g eslint_d prettier
let g:ale_linters = {
\   'c': ['cc', 'ccls', 'clangd', 'clangtidy', 'cppcheck', 'cquery', 'flawfinder'],
\   'css': ['prettier', 'stylelint'],
\   'go': ['gopls', 'gometalinter', 'gofmt', 'staticcheck'],
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'kotlin': ['kotlinc', 'ktlint'],
\   'make': ['checkmake'],
\   'python': ['mypy', 'pyre', 'pyright'],
\   'rust': ['analyzer', 'cargo', "rls', 'rustc'"],
\   'scss': ['sccslint', 'stylelint'],
\   'less': ['lessc', 'stylelint'],
\   'yaml': ['circleci', 'yamllint'],
\   'typescript': ['deno'],
\   'typescriptreact': ['tslint','tsserver'],
\}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clangtidy','uncrustify'],
\   'go': ['gofmt', 'goimports'],
\   'javascript': ['eslint', 'deno'],
\   'javascriptreact': ['eslint', 'deno'],
\   'kotlin': ['ktlint'],
\   'markdown': ['pandoc','textlint'],
\   'python': ['black', 'remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'scss': ['prettier', 'stylelint'],
\   'typescript': ['deno'],
\   'typescriptreact': ['deno'],
\   'less': ['prettier'],
\   'yaml': ['yamlfix'],
\}

" FROM: https://github.com/dense-analysis/ale/issues/1353
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

" NOTE: This makes it possible to show the quickfix with :copen
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" FROM: https://github.com/dense-analysis/ale/issues/249
let g:ale_sign_warning = '•'
let g:ale_sign_error = "➤"
" NOTE: We disable LSP as we have Coc
" <https://github.com/dense-analysis/ale#5iii-how-can-i-use-ale-and-cocnvim-together>
let g:ale_disable_lsp = 1

" EOF
