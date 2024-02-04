" SEE: https://github.com/Chiel92/vim-autoformat
" NOTE: The autoindent is crap
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
" This one is useful
let g:autoformat_remove_trailing_spaces = 1
let g:formatdef_xmllint = '"XMLLINT_INDENT=\"	\" xmllint --format /dev/stdin"'
let g:formatters_xslt = ['xmllint']
" Autoformat is easier to configure than ALE

au BufWrite xslt :Autoformat
au BufWrite xml  :Autoformat
au BufWrite py   :Autoformat
au BufWrite js   :Autoformat
" EOF
