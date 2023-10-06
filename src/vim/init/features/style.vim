" @command Shows a sample of the syntax
command! SyntaxSample so $VIMRUNTIME/syntax/hitest.vim

" The color scheme
colorscheme gold

" Full color in terminal
set termguicolors

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
