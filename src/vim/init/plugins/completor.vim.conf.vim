set completeopt=longest,menuone
" We add the dictionary to the completion
set complete+=kspell
" We hide completion messages, 
set shortmess+=c

" FROM: https://stackoverflow.com/questions/35837990/how-to-trigger-omnicomplete-auto-completion-on-keystrokes-in-insert-mode/47967462#47967462
function! OpenCompletion()
	if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z') || (v:char >= '0' && v:char <= '9') || (v:char == '_'))
		call feedkeys("\<C-p>", "n")
	endif
endfunction

autocmd InsertCharPre * call OpenCompletion()
