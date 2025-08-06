" -----------------------------------------------------------------------------
" KEYMAP
" -----------------------------------------------------------------------------

" The local leader
let mapleader=","
let maplocalleader=","

" @func Toggle format expression betwen VIM & LSP
function! ToggleFormatExpr()
  if &formatexpr == 'v:lua.vim.lsp.formatexpr()'
    setlocal formatexpr=
    echo 'Using standard formatting'
  else
    setlocal formatexpr=v:lua.vim.lsp.formatexpr()
    echo 'Using LSP formatting'
  endif
endfunction

" @group Telescope (Fuzzy finder)
" =========================
"
" @keymap Fuzzy-finder popup with opened buffers
nmap     <C-P>               <cmd>Telescope buffers<CR>
nmap     <C-I>               <cmd>Telescope find_files<CR>
" @keymap Fuzz-finder popup with tags
nmap     <C-T>               <cmd>Telescope lsp_document_symbols<CR>
" @keymap Fuzzy-finder popup with live search
nmap     <C-O>               <cmd>Telescope grep_string<CR>
nmap     <leader>gg          <cmd>Telescope lsp_definitions<CR>
" @keymap Fuzzy-finder popup with project files
nnoremap <leader>o           <cmd>NvimTreeToggle<CR>
nnoremap <leader>t           <cmd>AerialToggle<CR>
" @keymap Toggles Formatting
nnoremap <leader>tf           <cmd>ToggleFormat<CR>

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
nnoremap <C-S-U>        zC
" @keymap Unfold
nnoremap <C-S-K>      zO

" @keymap Increase fold level
nnoremap <C-S-L>     zr
" @keymap Decrease fold level
nnoremap <C-S-J>      zm

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
