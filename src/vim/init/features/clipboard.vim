" FIXME: This triggers a super slow load time, see: nvim -V10nvim.log
" set clipboard=unnamedplus

" lua << EOF
" -- FROM: https://github.com/wez/wezterm/discussions/5231
" -- vim.g.clipboard = {
" -- 	name = 'OSC 52',
" -- 	copy = {
" -- 	  ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
" -- 	  ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
" -- 	},
" -- 	paste = {
" -- 	  ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
" -- 	  ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
" -- 	},
" -- }
" EOF
" SEE: https://vi.stackexchange.com/questions/12376/vim-on-wsl-synchronize-system-clipboard-set-clipboard-unnamed
" let s:clip = '/mnt/c/Windows/System32/clip.exe'
" if executable(s:clip)
"     augroup WSLYank
"         autocmd!
"         autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
"     augroup END
" end
