lua << EOF
local function is_module_installed(module_name)
    local status, _ = pcall(require, module_name)
    return status
end
if is_module_installed("mason") then
	require("mason").setup()
end
EOF
