" SEE: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
" npm install -g vscode-html-languageserver-bin
" npm install -g vscode-css-languageserver-bin
" npm install -g vscode-json-languageserver

lua << EOF
local nvim_lsp = require'lspconfig'
local on_attach = function(client)
    require'completion'.on_attach(client)
end
nvim_lsp.denols.setup({on_attach=on_attach})
nvim_lsp.pyright.setup({on_attach=on_attach})
nvim_lsp.gopls.setup({on_attach=on_attach})
nvim_lsp.cssls.setup({on_attach=on_attach})
nvim_lsp.html.setup({on_attach=on_attach})
nvim_lsp.jsonls.setup({on_attach=on_attach})
nvim_lsp.rust_analyzer.setup({on_attach=on_attach})

-- FIXME: Not sure
nvim_lsp.denols.setup(coq.lsp_ensure_capabilities())
nvim_lsp.pyright.setup(coq.lsp_ensure_capabilities())
nvim_lsp.gopls.setup(coq.lsp_ensure_capabilities())
nvim_lsp.cssls.setup(coq.lsp_ensure_capabilities())
nvim_lsp.html.setup(coq.lsp_ensure_capabilities())
nvim_lsp.jsonls.setup(coq.lsp_ensure_capabilities())
nvim_lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities())

-- Enable diagnostics
-- FROM :https://sharksforarms.dev/posts/neovim-rust/
-- FROM :https://sharksforarms.dev/posts/neovim-rust
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

require'nvim-treesitter.configs'.setup {highlight={enable=true},}
EOF



" SEE: lsp-config
set omnifunc=v:lua.vim.lsp.omnifunc

function LspStatus()
  lua print(vim.inspect(vim.lsp.buf_get_clients()))
endfunction

function LspInspect()
  lua print(vim.inspect(vim.lsp))
endfunction
" EOF
