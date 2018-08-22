" Registers additional font configuration
if has('rpcnotify')
	if has('rpcnotify')
		" @feature Fonts: Enable open type features (neovim-gtk)
		call rpcnotify(1, 'Gui', 'FontFeatures', 'PURS, cv17')
	endif
endif

if exists('GuiFont')
	" @feature Fonts: Font selection in neovim-qt
	" TODO: We might want to parameter this
	GuiFont Iosevka Term:h11
endif

" EOF
