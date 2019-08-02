" TODO: Move this to a plugin configuration
" let g:UltiSnipsExpandTrigger='<C->'
" UltiSnip hijacks the tab, and we don't want that.
" iunmap <Tab>
imap <C-Tab> * <C-R>=UltiSnips#ExpandSnippet()<CR>
