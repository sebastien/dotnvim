set completeopt=longest,menuone,preview,noinsert,noselect
" We add the dictionary to the completion
set complete+=kspell
" We hide completion messages,
set shortmess+=c
"
" TODO: Move to apc
let g:completion_min_length = 2

" FROM: https://stackoverflow.com/questions/35837990/how-to-trigger-omnicomplete-auto-completion-on-keystrokes-in-insert-mode/47967462#47967462
function! OpenCompletion()
	" FROM: https://github.com/skywind3000/vim-auto-popmenu
	let matches = matchlist(strpart(getline('.'), 0, col('.') - 1), '\(\k\{' . g:completion_min_length . ',}\)$')
	if empty(matches)
	else
		call feedkeys("\<C-p>", "n")
	endif
endfunction

" autocmd InsertCharPre * call OpenCompletion()
" autocmd CursorMovedI * call OpenCompletion()
