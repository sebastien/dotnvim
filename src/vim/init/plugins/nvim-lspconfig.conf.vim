" SEE: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
" npm install -g vscode-html-languageserver-bin
" npm install -g vscode-css-languageserver-bin
" npm install -g vscode-json-languageserver

lua << EOF
local nvim_lsp = require'lspconfig'
local on_attach = function(client)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    require'completion'.on_attach(client)
end
for _, server in ipairs({"pyright", "denols", "gopls", "cssls", "html", "jsonls"}) do
	nvim_lsp[server].setup({capabilities=coq.lsp_ensure_capabilities(),on_attach=on_attach})
end

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
