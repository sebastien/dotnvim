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

" TODO: Support for PackageInstall
" TODO: Make sure to cleanup any unwanted plugin

" -----------------------------------------------------------------------------
" BOOTSTRAPPING
" -----------------------------------------------------------------------------

" We try to load minpac.
silent! packadd minpac

let $MINPAC_ROOT=g:vim_config_path . '/pack/minpac/opt'

" If minpac is not available, we get it from Github and make it ready
if !exists('*minpac#init')
	if !isdirectory($MINPAC_ROOT)
		call mkdir($MINPAC_ROOT, "p")
		!git clone https://github.com/k-takata/minpac.git $MINPAC_ROOT/minpac
	endif
	silent! packadd minpac
endif


" @function Automatically updates the added plugins if the list of plugins has
" changed or if it's been more than a week.
function plugins#autoupdate()
	let plugins_config_path  = g:vim_config_path . "/init/plugins.list" 
	let plugins_updated_path = g:vim_config_path . "/init/.plugins.updated" 
	let timestamp_now        = str2nr(strftime('%s')) / 3600
	let timestamp_conf       = str2nr(system( "stat --printf '%Y' " . plugins_config_path)) / 3600
	let timestamp_updated    = str2nr(system( "stat --printf '%Y' " . plugins_updated_path)) / 3600
	let timestamp_delta      = timestamp_now - timestamp_updated
	if timestamp_updated < timestamp_conf || timestamp_delta > 7
		echo "minpac: Updating plugins"
		call minpac#update()
		call minpac#clean()
		call writefile([today], plugins_updated_path)
	endif
endfunction

" @function Regsiters all the plugins declared in `plugins.list`
function plugins#register()
	let plugins_config_path = g:vim_config_path . "/init/plugins.list" 
	if filereadable(plugins_config_path)
		" We have a list of plugins, we get them and add them
		let plugins_list = filter(readfile(plugins_config_path), 'v:val !~ "#"')
		for plugin in plugins_list
			call minpac#add(plugin)
		endfor
	else
		echo "minpac: Edit the '" . plugins_config_path . "' file with a list of plugins to load"
		execute 'edit ' . fnameescape(plugins_config_path)
	endif
endfunction

" @function Loads all the plugins registered in minpack and loads their
" conifugration file if available.
function plugins#load()
	packloadall
	for plugin in keys(minpac#getpluglist())
		let plugin_path = g:vim_config_path . "/init/plugins/" . plugin . ".conf.vim"
		if filereadable(plugin_path)
			execute 'source ' . fnameescape(plugin_path)
		endif
	endfor
endfunction

" -----------------------------------------------------------------------------
" LOADING THE PLUGINS
" -----------------------------------------------------------------------------

" We try to see if it's available now
if exists('*minpac#init')

	" We initialize minpac
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})

	" Start by loading the list of plugins
	call plugins#register()
	" Now we update/cleanup the plugins
	call plugins#autoupdate()
	" We ask minpac to load all the plugins
	call plugins#load()

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
