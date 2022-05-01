" FROM: https://github.com/nvim-telescope/telescope-file-browser.nvim
lua << EOF
require("telescope").load_extension "file_browser"
EOF
