" SEE: https://github.com/Chiel92/vim-autoformat
" NOTE: The autoindent is crap
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
" This one is useful
let g:autoformat_remove_trailing_spaces = 1
au BufWrite * :Autoformat

