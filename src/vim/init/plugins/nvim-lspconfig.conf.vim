" SEE: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
" npm install -g vscode-html-languageserver-bin
" npm install -g vscode-css-languageserver-bin
" npm install -g vscode-json-languageserver
" npm install -g typescript typescript-language-server
" npm install -g diagnostic-languageserver

lua << EOF
if pcall(require, "lspconfig") then
	local nvim_lsp = require'lspconfig'
	local on_attach = function(client)
		--vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
		vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
		-- We disable LSP format expr
		vim.api.nvim_buf_set_option(0, 'formatexpr', '')
		-- Disable document formatting for this LSP client
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end
	-- SEE: https://neovim.io/doc/user/lsp.html
	for _, server in ipairs({"pyright", "ts_ls", "gopls", "cssls", "html", "jsonls", "zls"}) do
		-- FIXME: Should detect if coq is available or not
		if coq then
			nvim_lsp[server].setup({
				capabilities=coq.lsp_ensure_capabilities(),on_attach=on_attach
			})
		end
		nvim_lsp[server].setup({on_attach=on_attach})
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
	
	-- Configure LSP floating windows with rounded borders
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
		vim.lsp.handlers.hover, {
			border = "rounded"
		}
	)
	
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help, {
			border = "rounded"
		}
	)
	
	-- Configure diagnostic floating windows
	vim.diagnostic.config({
		float = {
			border = "rounded"
		}
	})
end

if pcall(require, "nvim-treesitter.configs") then
	require'nvim-treesitter.configs'.setup {highlight={enable=true},}
end
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
