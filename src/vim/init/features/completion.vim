" set completeopt=longest,menuone,preview,noinsert,noselect
set completeopt=menu,menuone,noselect
" We add the dictionary to the completion
set complete+=kspell
" We hide completion messages,
set shortmess+=c

" " NOTE: You may already have these in your configuration somewhere.
" Autocomplete menu options
set completeopt=menuone,noselect,noinsert
set noshowmode
set shortmess+=c

" 🐓 Coq completion settings

" Keybindings
" ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
" ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
" ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
" ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
" ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

" EOF
