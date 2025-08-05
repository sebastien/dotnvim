" Optimized completion options for automatic LSP completions
set completeopt=menu,menuone,noselect,noinsert
" We add the dictionary to the completion
set complete+=kspell
" We hide completion messages,
set shortmess+=c

" Autocomplete menu options for real-time completions
set completeopt=menuone,noselect,noinsert
set noshowmode
set shortmess+=c

" Enable automatic completion triggers
set updatetime=300

" 🐓 Coq completion settings

" Keybindings
" ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
" ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
" ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
" ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
" ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

" EOF
