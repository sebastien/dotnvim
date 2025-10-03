" SEE: https://github.com/dense-analysis/ale
" npm i -g eslint_d @biomejs/biome
let g:ale_linters = {
\   'c': ['cc', 'ccls', 'clangd', 'clangtidy', 'cppcheck', 'cquery', 'flawfinder'],
\   'css': ['prettier', 'stylelint'],
\   'go': ['gopls', 'gometalinter', 'gofmt', 'staticcheck'],
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'json': ['eslint'],
\   'janet': ['janet'],
\   'kotlin': ['kotlinc', 'ktlint'],
\   'make': ['checkmake'],
\   'python': ['mypy', 'pyflakes', 'bandit'],
\   'rust': ['analyzer', 'cargo', "rls', 'rustc'"],
\   'scss': ['sccslint', 'stylelint'],
\   'sh': ['shellcheck'],
\   'less': ['lessc', 'stylelint'],
\   'yaml': ['circleci', 'yamllint'],
\   'html': ['htmlhint', 'tidy'],
\   'xhtml': ['htmlhint', 'tidy'],
\   'xml': ['xmllint'],
\   'xslt': ['xmllint'],
\   'typescript': ['deno'],
\   'typescriptreact': ['tslint','ts_ls'],
\   'zig': ['zls'],
\}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clangtidy','uncrustify'],
\   'go': ['gofmt', 'goimports'],
\   'javascript': ['biome'],
\   'javascriptreact': ['biome'],
\   'json': ['biome'],
\   'janet': ['jfmt'],
\   'kotlin': ['ktlint'],
\   'markdown': ['pandoc','textlint'],
\   'python': ['black', 'remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'sh': ['shfmt'],
\   'scss': ['biome', 'stylelint'],
\   'css': ['biome', 'stylelint'],
\   'typescript': ['biome'],
\   'typescriptreact': ['biome'],
\   'less': ['biome'],
\   'yaml': ['yamlfix'],
\   'html': ['biome'],
\   'xhtml': ['biome'],
\   'xml': ['biome','xmllint'],
\   'xslt': ['biome','xmllint'],
\   'zig': ['zigfmt'],
\}

" function! For" FROM: https://github.com/dense-analysis/ale/issues/1353
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

" NOTE: This makes it possible to show the quickfix with :copen
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" FROM: https://github.com/dense-analysis/ale/issues/249
let g:ale_sign_warning = '•'
let g:ale_sign_error = "➤"
let g:ale_disable_lsp = 0

" EOF
