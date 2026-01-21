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
nmap     <C-O>               <cmd>Telescope live_grep<CR>
nmap     <leader>gg          <cmd>Telescope lsp_definitions<CR>
nmap     <leader>d           <cmd>Telescope lsp_definitions<CR>
nmap     <leader>r           <cmd>Telescope lsp_references<CR>
" Quickfix list
nmap     <leader>f           <cmd>Telescope diagnostics<CR>
nmap     <leader>qf          <cmd>:lua vim.diagnostic.setqflist({open=true})<CR>
nmap     <leader>b           :pop<CR>
" @keymap Fuzzy-finder popup with project files
nnoremap <leader>o           <cmd>NvimTreeToggle<CR>
nnoremap <leader>t           <cmd>AerialToggle<CR>
" @keymap Toggles Formatting
nnoremap <leader>tf           <cmd>ToggleFormat<CR>

" Basic opencode commands
nnoremap <silent> <leader>oa :lua opencode.ask()<CR>
nnoremap <silent> <leader>ot :lua opencode.toggle()<CR>
nnoremap <silent> <leader>op :lua opencode.select_prompt()<CR>
nnoremap <silent> <leader>on :lua opencode.command("session_new")<CR>

" Context-aware commands
nnoremap <silent> <leader>oA :lua opencode.ask("@cursor: ")<CR>
vnoremap <silent> <leader>oa :lua opencode.ask("@selection: ")<CR>
nnoremap <silent> <leader>oe :lua opencode.prompt("Explain @cursor and its context")<CR>

" Message navigation
nnoremap <silent> <S-C-u> :lua opencode.command("messages_half_page_up")<CR>
nnoremap <silent> <S-C-d> :lua opencode.command("messages_half_page_down")<CR>

" Utility commands
nnoremap <silent> <leader>oy :lua opencode.command("messages_copy")<CR>
" FIXME: Does not seem to work
" inoremap <silent> <S-Tab>copilot#Accept("\<CR>")<CR>


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

" " @keymap Font zoom in
" nnoremap <C-+> :call font#increase()<CR>
"
" " @keymap Font zoom out
" nnoremap <C--> :call font#decrease()<CR>

" @group Common editor shortcuts
" ==============================
"
" @keymap Save
nnoremap <C-S> :w<CR>
" @keymap Quit
nnoremap <C-Q> :qa<CR>
" @keymap Select all
nnoremap <C-a> ggVG
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
