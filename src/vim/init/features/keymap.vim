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
nmap     <C-P>               <cmd>Telescope buffers<CR>
" @keymap Fuzz-finder popup with tags
nmap     <C-T>               <cmd>Telescope lsp_dynamic_workspace_symbols<CR>
" @keymap Fuzz-finder popup with tags
nmap     <leader>d           <cmd>Telescope diagnostics<CR>
nmap     <leader>gg          <cmd>Telescope lsp_definition<CR>
" @keymap Fuzzy-finder popup with project files
nmap     <C-Space>           <cmd>Telescope find_files<CR>
" @keymap Fuzzy-finder popup with live search
nmap     <C-O>               <cmd>Telescope live_grep<CR>
" @keymap File Explorer
nnoremap <leader>o           <cmd>CHADopen<CR>
" @keymap Symbol Explorer
nnoremap  <leader>t          <cmd>SymbolsOutline<CR>
" @keymap Symbol Explorer
nnoremap  <leader>q          <cmd>lua require('vimway-lsp-diag').open_all_diagnostics()<cr>
nnoremap  <leader>qb         <cmd>lua require('vimway-lsp-diag').open_buffer_diagnostics()<cr>


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
" @keymap Copy to cplyboard
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
