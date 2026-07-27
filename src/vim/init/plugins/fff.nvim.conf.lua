-- SEE: https://github.com/dmtrKovalenko/fff.nvim
-- The native search binary is downloaded or built by the PackChanged hook.
require("fff").setup({
  lazy_sync = true,
  grep = {
    modes = { "plain", "regex", "fuzzy" },
  },
})
