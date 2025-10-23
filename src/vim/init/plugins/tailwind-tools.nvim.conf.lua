-- SEE: luckasRanarison/tailwind-tools.nvim
-- Create a mock lspconfig module that uses the new vim.lsp.config API
local old_lspconfig = package.loaded['lspconfig']

local util = {
	root_pattern = function(...)
		local patterns = {...}
		return function(fname)
			for _, pattern in ipairs(patterns) do
				local path = vim.fn.find(pattern, vim.fn.fnamemodify(fname, ':p:h') .. ';')
				if path ~= '' then
					return vim.fn.fnamemodify(path, ':p:h')
				end
			end
			return nil
		end
	end,
	
	root_markers_with_field = function(root_files, markers, field, fname)
		local root = vim.fn.fnamemodify(fname, ':p:h')
		while root ~= '/' do
			for _, marker in ipairs(markers) do
				local marker_path = root .. '/' .. marker
				if vim.fn.filereadable(marker_path) == 1 then
					if field then
						local content = vim.fn.readfile(marker_path)
						for _, line in ipairs(content) do
							if line:find('"' .. field .. '"') or line:find("'" .. field .. "'") then
								return root
							end
						end
					else
						return root
					end
				end
			end
			root = vim.fn.fnamemodify(root, ':h')
		end
		return nil
	end,
	
	insert_package_json = function(root_files, field, fname)
		local root = vim.fn.fnamemodify(fname, ':p:h')
		while root ~= '/' do
			for _, marker in ipairs({'package.json', 'package.json5'}) do
				local marker_path = root .. '/' .. marker
				if vim.fn.filereadable(marker_path) == 1 then
					if field then
						local content = vim.fn.readfile(marker_path)
						for _, line in ipairs(content) do
							if line:find('"' .. field .. '"') or line:find("'" .. field .. "'") then
								return root
							end
						end
					else
						return root
					end
				end
			end
			root = vim.fn.fnamemodify(root, ':h')
		end
		return nil
	end
}

package.loaded['lspconfig'] = {
	util = util,
	tailwindcss = {
		setup = function(config)
			-- Convert lspconfig-style config to vim.lsp.config format
			local new_config = {
				on_attach = config.on_attach,
				settings = config.settings,
				root_dir = config.root_dir,
				capabilities = config.capabilities,
			}
			
			-- Use the new API
			vim.lsp.config.tailwindcss = new_config
			vim.lsp.enable('tailwindcss')
		end
	}
}

require("tailwind-tools").setup({
	---@type TailwindTools.Option
	{
		server = {
			override = true, -- let the plugin set up the server using our mock lspconfig
			settings = { -- shortcut for `settings.tailwindCSS`
				-- experimental = {
				--   classRegex = { "tw\\('([^']*)'\\)" }
				-- },
				-- includeLanguages = {
				--   elixir = "phoenix-heex",
				--   heex = "phoenix-heex",
				-- },
			},
			on_attach = function(client, bufnr) end, -- callback executed when the language server gets attached to a buffer
			root_dir = function(fname) end, -- overrides the default function for resolving the root directory
		},
		document_color = {
			enabled = true, -- can be toggled by commands
			kind = "inline", -- "inline" | "foreground" | "background"
			inline_symbol = "󰝤 ", -- only used in inline mode
			debounce = 200, -- in milliseconds, only applied in insert mode
		},
		conceal = {
			enabled = false, -- can be toggled by commands
			min_length = nil, -- only conceal classes exceeding the provided length
			symbol = "󱏿", -- only a single character is allowed
			highlight = { -- extmark highlight options, see :h 'highlight'
				fg = "#38BDF8",
			},
		},
		keymaps = {
			smart_increment = { -- increment tailwindcss units using <C-a> and <C-x>
				enabled = true,
				units = { -- see lua/tailwind/units.lua to see all the defaults
					{
						prefix = "border",
						values = { "2", "4", "6", "8" },
					},
					-- ...
				},
			},
		},
		cmp = {
			highlight = "foreground", -- color preview style, "foreground" | "background"
		},
		telescope = {
			utilities = {
				callback = function(name, class) end, -- callback used when selecting an utility class in telescope
			},
		},
		-- see the extension section to learn more
		extension = {
			queries = {}, -- a list of filetypes having custom `class` queries
			patterns = { -- a map of filetypes to Lua pattern lists
				-- rust = { "class=[\"']([^\"']+)[\"']" },
				-- javascript = { "clsx%(([^)]+)%)" },
			},
		},
	},
})

-- Restore lspconfig if it was previously loaded
package.loaded['lspconfig'] = old_lspconfig
