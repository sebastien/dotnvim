" -----------------------------------------------------------------------------
" KEYMAP
" -----------------------------------------------------------------------------

"
" @group FZF (Fuzzy finder)
" =========================
" TODO: Should test for FZF feature
"
" @keymap Fuzzy-finder popup with opened buffers
nmap     <C-P>               :Buffers<CR>
" @keymap Fuzz-finder popup with tags
nmap     <C-T>               :Tags<CR>
" @keymap Fuzzy-finder popup with project files
nmap     <C-Space>           :FZF<CR>

" @group Tab indentation
" ======================
"
" @keymap Indent on tab
vnoremap <Tab> >
" @keymap Dedent on shift-tab
vnoremap <S-Tab> <LT>

" @group Folding
" ==============================

" @keymap Fold
nnoremap <C-Up>        zC
" @keymap Unfold
nnoremap <C-Down>      zO

" @keymap Increase fold level
nnoremap <C-Right>     zr
" @keymap Decrease fold level
nnoremap <C-Left>      zm

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
