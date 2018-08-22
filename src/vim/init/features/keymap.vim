" -----------------------------------------------------------------------------
" KEYMAP
" -----------------------------------------------------------------------------

" TODO: Should test for FZF feature
"
" @group FZF (Fuzzy finder)
" =========================
"
" @keymap Fuzzy-finder popup with opened buffers
nmap     <C-P>               :Buffers<CR>
" @keymap Fuzzy-finder popup with project files
nmap     <C-Space>           :FZF<CR>
" @keymap Fuzz-finder popup with tags
nmap     <C-T>               :FZFTags<CR>

" @group Tab indentation
" ======================
"
" @keymap Indent on tab
vnoremap <Tab> >
" @keymap Dedent on shift-tab
vnoremap <S-Tab> <LT>

" @group Common editor shortcuts
" ==============================
"
" @keymap Common save shortcut
nnoremap <C-S> :w<CR>
" @keymap Common quit shortcut
nnoremap <C-Q> :qa<CR>
" @keymap Common copy shortcut
vmap     <C-c> "+yi
" @keymap Common cut shortcut
vmap     <C-x> "+c
" @keymap Common paste shortcut
vmap     <C-v> c<ESC>"+p
imap     <C-v> <C-r><C-o>+

" EOF
