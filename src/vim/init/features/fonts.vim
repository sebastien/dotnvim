" Registers additional font configuration
" @feature Fonts: Enable open type features (neovim-gtk)
if exists('g:GtkGuiLoaded')
	call rpcnotify(1, 'Gui', 'FontFeatures', 'PURS, cv17')
	call rpcnotify(1, 'Gui', 'Font', 'Iosevka Term 10')
endif

" EOF
