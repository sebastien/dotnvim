" nvim-lsp-installer is deprecated, using mason.nvim instead
" lua <<EOF
" if pcall(require,"nvim-lsp-installer") then
" require("nvim-lsp-installer").setup({
"     automatic_installation = true,
"     ui = {
"         icons = {
"             server_installed = "✓",
"             server_pending = "➜",
"             server_uninstalled = "✗"
"         }
"     }
" })
" end
" EOF
