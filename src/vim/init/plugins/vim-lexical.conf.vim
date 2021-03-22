" FROM: https://github.com/reedes/vim-lexical
" SEE: :help spellfile.vim
let g:lexical#spell = 1         " 0=disabled, 1=enabled
let g:lexical#spelllang = ['en_nz','en_us',]
let g:lexical#spell_key = '<leader>s'
let g:lexical#thesaurus_key = '<leader>t'
let g:lexical#dictionary_key = '<leader>k'

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

" EOF
