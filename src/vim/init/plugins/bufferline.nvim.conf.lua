-- SEE https://neovimcraft.com/plugin/akinsho/bufferline.nvim/
if pcall(require, 'bufferline') then
	vim.opt.termguicolors = true
	require("bufferline").setup{
		options = {
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
			  local icon = level:match("error") and " " or " "
			  return " " .. icon .. count
			end
		}
	}
end
