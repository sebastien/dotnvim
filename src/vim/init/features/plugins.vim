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

" -----------------------------------------------------------------------------
" BOOTSTRAPPING
" -----------------------------------------------------------------------------

" We try to load minpac.
silent! packadd minpac

" If minpac is not available, we get it from Github and make it ready
if !exists('*minpac#init')
	!mkdir $(dirname $MYVIMRC)/pack/minpac/opt ; true
	!git clone https://github.com/k-takata/minpac.git $(dirname $MYVIMRC)/pack/minpac/opt/minpac
	silent! packadd minpac
endif

" -----------------------------------------------------------------------------
" LOADING THE PLUGINS
" -----------------------------------------------------------------------------

" We try to see if it's available now
if exists('*minpac#init')
	" We initialize minpac
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})
	" We load the list of plugins
	let plugins_config_path  = g:vim_config_path . "/init/plugins.list" 
	let plugins_updated_path = g:vim_config_path . "/init/.plugins.updated" 
	if !filereadable(plugins_config_path)
		" If it's not there, we edit it
		echo "minpac: Edit the '" . plugins_config_path . "' file with a list of plugins to load"
		execute 'edit ' . fnameescape(plugins_config_path)
	endif

	" TODO: Should not have to call that all the time, only if minpac
	" does not already have the plugin.
	let today = strftime('%Y%m%d')
	if !filereadable(plugins_updated_path) || readfile(plugins_updated_path)[0] != today
		echo "minpac: Updating plugins"
		call minpac#update()
		call writefile([today], plugins_updated_path)
	endif

	if filereadable(plugins_config_path)
		" We have a list of plugins, we get them and add them
		let plugins_list = filter(readfile(plugins_config_path), 'v:val !~ "#"')
		for plugin in plugins_list
			call minpac#add(plugin)
		endfor
	endif

	" Load the plugins right now
	packloadall

	" And configures them using the configuration variables
	for plugin in keys(minpac#getpluglist())
		let plugin_path = g:vim_config_path . "/init/plugins/" . plugin . ".vim"
		if filereadable(plugin_path)
			execute 'source ' . fnameescape(plugin_path)
		endif
	endfor

	call init#features_load()

endif

" -----------------------------------------------------------------------------
" CUSTOM COMMANDS
" -----------------------------------------------------------------------------

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.

" @command Updates all registered packages
command! PluginsUpdate packadd minpac | source $MYVIMRC | call minpac#update()

" @command Cleans all installed packages
command! PluginsClean  packadd minpac | source $MYVIMRC | call minpac#clean()

" @command Lists the installed packages
command! PluginsList  packadd minpac | call minpac#list()

" EOF
