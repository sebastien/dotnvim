" SEE: https://github.com/ms-jpq/coq_nvim/blob/coq/docs/KEYBIND.md
let g:coq_settings = { 'keymap.recommended': v:false, 'keymap.manual_complete': '<c-l>', 'auto_start':'shut-up', 'completion.always': v:true, 'clients.third_party.enabled': v:false}


" Customising keybindings
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <Tab>   pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
" FIXME: The if exists does not seem to work
" if exists("COQnow")
COQnow -s
"endif
" EOF
