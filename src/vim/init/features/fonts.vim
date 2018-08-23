" Registers additional font configuration
if has('rpcnotify')
	if has('rpcnotify')
		" @feature Fonts: Enable open type features (neovim-gtk)
		call rpcnotify(1, 'Gui', 'FontFeatures', 'PURS, cv17')
	endif
endif

" EOF
