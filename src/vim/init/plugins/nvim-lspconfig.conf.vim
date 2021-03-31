" SEE: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
" npm install -g vscode-html-languageserver-bin
" npm install -g vscode-css-languageserver-bin
" npm install -g vscode-json-languageserver
lua << EOF
require'lspconfig'.denols.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.jsonls.setup{}
EOF

" SEE: lsp-config
set omnifunc=v:lua.vim.lsp.omnifunc

function LspStatus()
  lua print(vim.inspect(vim.lsp.buf_get_clients()))
endfunction

function LspInspect()
  lua print(vim.inspect(vim.lsp))
endfunction
