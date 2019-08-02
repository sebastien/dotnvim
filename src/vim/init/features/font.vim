" Registers additional font configuration
" @feature Fonts: Enable open type features (neovim-gtk)
if exists('g:GtkGuiLoaded')
	call rpcnotify(1, 'Gui', 'FontFeatures', 'PURS, cv17')
endif

"let g:font_family = 'M+ 1m'
let g:font_family = 'Iosevka Term'
let g:font_size   = 10

function font#zoom(delta)
	let g:font_size = max([6,g:font_size + a:delta])
	call font#set(g:font_family,g:font_size)
endfunction

function font#increase()
	call font#zoom(1)
endfunction

function font#decrease()
	call font#zoom(-1)
endfunction

function font#set(family, size)
	if exists('g:GtkGuiLoaded')
		call rpcnotify(1, 'Gui', 'Font', a:family . " " . a:size)
	endif
endfunction

" EOF
