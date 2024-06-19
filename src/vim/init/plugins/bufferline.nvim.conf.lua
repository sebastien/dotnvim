-- SEE https://neovimcraft.com/plugin/akinsho/bufferline.nvim/
if pcall(require, 'bufferline') then
	vim.opt.termguicolors = true
	require("bufferline").setup{}
end
