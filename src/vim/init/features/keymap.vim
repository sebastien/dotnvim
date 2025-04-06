" -----------------------------------------------------------------------------
" KEYMAP
" -----------------------------------------------------------------------------

" The local leader
let mapleader=","
let maplocalleader=","


" @group Telescope (Fuzzy finder)
" =========================
"
" @keymap Fuzzy-finder popup with opened buffers
nmap     <C-P>               <cmd>FzfLua buffers<CR>
nmap     <C-I>               <cmd>FzfLua files<CR>
" @keymap Fuzz-finder popup with tags
nmap     <C-T>               <cmd>FzfLua lsp_document_symbols<CR>
" @keymap Fuzzy-finder popup with live search
nmap     <C-O>               <cmd>FzfLua grep_project<CR>
nmap     <leader>gg          <cmd>FzfLua lsp_definition<CR>
" @keymap Fuzzy-finder popup with project files
nnoremap <leader>o           <cmd>CHADopen<CR>

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

" @group Font zoom
" ================

" @keymap Font zoom in
nnoremap <C-+> :call font#increase()<CR>

" @keymap Font zoom out
nnoremap <C--> :call font#decrease()<CR>

" @group Common editor shortcuts
" ==============================
"
" @keymap Save
nnoremap <C-S> :w<CR>
" @keymap Quit
nnoremap <C-Q> :qa<CR>
" @keymap Select all
nnoremap <C-a> ggvG$
" @keymap Select line
nnoremap <C-l> 0v$
" @keymap Copy to clipboard
vmap     <C-c> "+yi
" @keymap Cut to clipboard
vmap     <C-x> "+c
" @keymap Paste
vmap     <C-v> c<ESC>"+p
imap     <C-v> <C-r><C-o>+

" @group Editor shortcuts
" =======================

" @remap Insert closing bracket/element
" inoremap "" "<Left>
" inoremap () ()<Left>
" inoremap {} {}<Left>
" inoremap [] []<Left>

" EOF
