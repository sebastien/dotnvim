-- SEE: https://github.com/mfussenegger/nvim-lint
require('lint').linters_by_ft = {
  markdown = {'vale',},
  python = {'mypy','bandit','codespell',},
  javascript = {'eslint','deno',},
  html = {'tidy',},
  bash = {'shellcheck',},
  lua = {'luacheck',},
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

