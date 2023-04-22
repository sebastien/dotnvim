" SEE: https://github.com/dense-analysis/ale
" npm i -g eslint_d prettier
let g:ale_linters = {
\   'c': ['cc', 'ccls', 'clangd', 'clangtidy', 'cppcheck', 'cquery', 'flawfinder'],
\   'css': ['prettier', 'stylelint'],
\   'go': ['gopls', 'gometalinter', 'gofmt', 'staticcheck'],
\   'javascript': ['eslint', 'deno'],
\   'javascriptreact': ['eslint', 'deno'],
\   'json': ['eslint'],
\   'kotlin': ['kotlinc', 'ktlint'],
\   'make': ['checkmake'],
\   'python': ['mypy', 'ruff', 'bandit'],
\   'rust': ['analyzer', 'cargo', "rls', 'rustc'"],
\   'scss': ['sccslint', 'stylelint'],
\   'sh': ['shellcheck'],
\   'less': ['lessc', 'stylelint'],
\   'yaml': ['circleci', 'yamllint'],
\   'html': ['htmlhint', 'tidy'],
\   'xhtml': ['htmlhint', 'tidy'],
\   'typescript': ['deno'],
\   'typescriptreact': ['tslint','tsserver'],
\}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clangtidy','uncrustify'],
\   'go': ['gofmt', 'goimports'],
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'json': ['prettier'],
\   'kotlin': ['ktlint'],
\   'markdown': ['pandoc','textlint'],
\   'python': ['black', 'remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'sh': ['shfmt'],
\   'scss': ['prettier', 'stylelint'],
\   'css': ['prettier', 'stylelint'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'less': ['prettier'],
\   'yaml': ['yamlfix'],
\   'html': ['prettier'],
\   'xhtml': ['prettier'],
\}

" function! For" FROM: https://github.com/dense-analysis/ale/issues/1353
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
