" FROM: https://github.com/Shougo/neosnippet.vim
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.

" @keymap Snippets: <Ctr-n> to expand a snippet and further presses
" to iterate on the expressions.
" imap <C-f>     <Plug>(neosnippet_expand_or_jump)
" smap <C-f>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-f>     <Plug>(neosnippet_expand_target)

" Enabling this makes Neosnippet load snippets from ~/.snippets automatically
"
let g:neosnippet#enable_snipmate_compatibility = 1

" @keymap Snippets: <Tab> to expand a completable snippet
imap <expr><Tab>
\ neosnippet#expandable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"

" For conceal markers.
if has('conceal')
  set conceallevel=2
endif
