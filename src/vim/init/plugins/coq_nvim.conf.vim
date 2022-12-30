" SEE: https://github.com/ms-jpq/coq_nvim/blob/coq/docs/KEYBIND.md
let g:coq_settings = { 'keymap.manual_complete': '<c-l>', 'auto_start':'shut-up', 'completion.always': v:true, 'clients.third_party.enabled': v:false}

" FIXME: The if exists does not seem to work
" if exists("COQnow")
COQnow -s
"endif
" EOF
