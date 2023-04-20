lua <<EOF
if pcall(require, 'leap') then
	require('leap').set_default_keymaps()
end
EOF
