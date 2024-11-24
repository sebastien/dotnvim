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
nmap     <C-I>               <cmd>Telescope find_files<CR>
" @keymap Fuzz-finder popup with tags
nmap     <C-T>               <cmd>Telescope lsp_document_symbols<CR>
" @keymap Fuzz-finder popup with tags
nmap     <leader>d           <cmd>Trouble document_diagnostics<CR>
nmap     <leader>dg          <cmd>Trouble workspace_diagnostics<CR>
nmap     <leader>dq          <cmd>Trouble quickfix<CR>
nmap     <leader>gg          <cmd>Telescope lsp_definition<CR>
" @keymap Fuzzy-finder popup with project files
nnoremap <leader>i           <cmd>Telescope find_files<CR>
nnoremap <leader>o           <cmd>Telescope file_browser<CR>
" @keymap Fuzzy-finder popup with live search
nmap     <C-O>               <cmd>Telescope live_grep<CR>
" @keymap Symbol Explorer
nnoremap  <leader>q          <cmd>lua require('vimway-lsp-diag').open_all_diagnostics()<cr>
nnoremap  <leader>qb         <cmd>lua require('vimway-lsp-diag').open_buffer_diagnostics()<cr>

nnoremap  <leader>q          <cmd>lua require('vimway-lsp-diag').open_all_diagnostics()<cr>

" @keymap Trouble (quickfix)
nnoremap <leader>e  <cmd>TroubleToggle<cr>
nnoremap <leader>ed <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>ed <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>eq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>el <cmd>TroubleToggle loclist<cr>
nnoremap <leader>er <cmd>TroubleToggle lsp_references<cr>


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
