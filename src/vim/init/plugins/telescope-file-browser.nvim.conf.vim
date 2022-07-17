" FROM: https://github.com/nvim-telescope/telescope-file-browser.nvim
lua << EOF
if pcall(require, "telescope") then
	require("telescope").load_extension "file_browser"
end
EOF
