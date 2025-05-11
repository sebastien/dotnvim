-- SEE: https://cmp.saghen.dev/installation.html
-- NOTES: Need to be compiled by hand,
-- rustup toolchain install nightly
-- and then env -C ~/.config/nvim/pack/minpac/opt/blink.cmp/ cargo build --release
-- if that doesn't work, the files can be downloaded and installed in
-- target/release/libblink_cmp_fuzzy.{so,dylib}
require("blink.cmp").setup({
	-- SEE <https://cmp.saghen.dev/configuration/keymap.html>
	keymap = {
		["<Tab>"] = {
			function(cmp)
				if cmp.snippet_active() then
					return cmp.accept()
				else
					return cmp.select_and_accept()
				end
			end,
			"snippet_forward",
			"fallback",
		},
	},
	-- SEE: https://github.com/saghen/blink.cmp/releases/tag/v1.1.1
	fuzzy = {
		implementation = "prefer_rust_with_warning",
		prebuilt_binaries = { download = true, ignore_version_mismatch = true },
	},
})
