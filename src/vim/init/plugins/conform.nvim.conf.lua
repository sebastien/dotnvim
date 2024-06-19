-- SEE https://github.com/stevearc/conform.nvim
local success, err = pcall(function() require("conform") end)
if success then
require("conform").setup({
  formatters_by_ft = {
    -- lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    xml = { { "xmllint" } },
    nix = { { "nixfmt" } },
    sh = { { "shellcheck", "shfmt" } },
    -- Use the "*" filetype to run formatters on all filetypes.
    ["*"] = { "codespell" },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
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
