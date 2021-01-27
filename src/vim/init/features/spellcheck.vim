" From:
" <https://unix.stackexchange.com/questions/31154/spell-check-comments-in-vim>
" - `:help spell-syntax` to see how to enable per-syntax spell checking
set spell spelllang=en_us
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell
