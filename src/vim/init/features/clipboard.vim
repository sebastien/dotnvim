 " Use system clipboard when available, OSC52 as fallback
 " if executable("pbcopy") || executable("xclip") || executable("wl-copy")
 " 	set clipboard=unnamedplus
 " else
 " 	set clipboard=unnamed
 " end

lua << EOF
-- FROM: https://github.com/wez/wezterm/discussions/5231
vim.g.clipboard = {
	name = 'OSC 52',
	copy = {
	  ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
	  ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
	},
	paste = {
	  ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
	  ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
	},
}
EOF
" SEE: https://vi.stackexchange.com/questions/12376/vim-on-wsl-synchronize-system-clipboard-set-clipboard-unnamed
" let s:clip = '/mnt/c/Windows/System32/clip.exe'
" if executable(s:clip)
"     augroup WSLYank
"         autocmd!
"         autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
"     augroup END
" end
