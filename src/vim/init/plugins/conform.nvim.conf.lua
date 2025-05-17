-- SEE https://github.com/stevearc/conform.nvim
local success, _ = pcall(function()
	require("conform")
end)
if success then
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			-- NOTE: Ruff is too eager
			-- python = { "ruff_fix", "ruff_format" },
			python = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			xml = { "xmllint" },
			terraform = { "terraform_fmt" },
			hcl = { "hcl" },
			nix = { "nixfmt" },
			sh = { "shellcheck", "shfmt" },
			-- Use the "*" filetype to run formatters on all filetypes.
			-- ["*"] = { "codespell" },
			-- Use the "_" filetype to run formatters on filetypes that don't
			-- have other formatters configured.
			["_"] = { "trim_whitespace" },
		},
		formatters = {
			scalafmt = {
				-- If scalafmt is on your PATH, this might be enough.
				-- Otherwise, you might need to specify the command or use a .scalafmt.conf
				command = "scalafmt", -- Or full path if not in PATH
				args = { "--stdin" }, -- Common arguments
				stdin = true,
				-- You can specify a .scalafmt.conf file location if needed
				-- require_cwd = true, -- If formatter requires running in project root
			},
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_fallback = true,
		},
		format_after_save = {
			lsp_fallback = true,
		},
		-- Conform will notify you when a formatter errors
		notify_on_error = true,
	})
end

-- EOF
