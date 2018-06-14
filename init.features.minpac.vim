"" -----------------------------------------------------------------------------
" PACKAGE MANAGER
" -----------------------------------------------------------------------------
" We're using `minpack` as recommended by Modern Vim ― there's a little bit
" of extra boilerplate but it leverages Vim8+ new features.
" SEE: <https://github.com/k-takata/minpac>
" 
" {{{
"
" Minpac Package Manager
" ======================
"
" Automatically loads and installs
" [minpac](https://github.com/k-takata/minpac). Looks for a `init.plugins`
" file in the configuration file and installs the plugins listed there.
"
" ```shell
" $ cat ~/.config/nvim/init.plugins
" # The list of plugins to be loaded
" junegunn/fzf
" junegunn/fzf.vim
" maralla/completor.vim
" # EOF - vim: syntax=text
" ``` 
"
" }}}

" Try to load minpac.
silent! packadd minpac

if !exists('*minpac#init')
	" minpac is not available.
	" Settings for plugin-less environment.
	!mkdir $(dirname $MYVIMRC)/pack/minpac/opt ; true
	!git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
else
	" minpac is available.
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})
	let plugins_config_path = g:vim_config_path . "/init.plugins.list" 
	if !filereadable(plugins_config_path)
		echo "init.minpac.vim: Edit the '" . plugins_config_path . "' file with a list of plugins to load"
		execute 'edit ' . fnameescape(plugins_config_path)
	endif
	if filereadable(plugins_config_path)
		let plugins_list = filter(readfile(plugins_config_path), 'v:val !~ "#"')
		for plugin in plugins_list
			call minpac#add(plugin)
		endfor
	endif
	" Load the plugins right now. (optional)
	packloadall
endif

" EOF
