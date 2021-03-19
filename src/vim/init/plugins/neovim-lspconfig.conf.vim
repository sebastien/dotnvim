function LspStatus
  lua print(vim.inspect(vim.lsp.buf_get_clients()))
endfunction

function LspInspect
  lua print(vim.inspect(vim.lsp))
endfunction

lua << EOF
require'lspconfig'.pyright.setup{}
EOF

" To query:   :verbose set omnifunc?
set omnifunc="v:lua.vim.lsp.omnifunc"
