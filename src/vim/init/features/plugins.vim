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

let g:minpac_root=g:vim_config_path . '/pack/minpac/opt'
let g:plugins_initialized = 0

" If minpac is not available, we get it from Github and make it ready
if !exists('*minpac#init')
	if !isdirectory(g:minpac_root)
		call mkdir(g:minpac_root, "p")
		" NOTE: We construct the command instead of using env vars, as that would not
		" work in Windows.
		execute '!git clone https://github.com/k-takata/minpac.git "' . g:minpac_root . '/minpac"'
		silent! packadd minpac
	endif
endif

" -----------------------------------------------------------------------------
" FUNCTIONS
" -----------------------------------------------------------------------------

function plugins#update()
	let timestamp_now        = str2nr(localtime())
	let plugins_updated_path = g:vim_config_path . "/init/.plugins.updated"
	call minpac#update()
	call minpac#clean()
	call writefile([timestamp_now], plugins_updated_path)
	echo "input/plugins: Minpac updated"
endfunction

" @function Automatically updates the added plugins if the list of plugins has
" changed or if it's been more than a week.
function plugins#autoupdate()
	" NOTE: We need to read the links otherwise the mtime will be that of the
	" link.
	let plugins_config_path  = resolve(expand(g:vim_config_path . '/init/plugins.list'))
	let plugins_updated_path = g:vim_config_path . "/init/.plugins.updated"
	let timestamp_now        = str2nr(localtime())
	let timestamp_conf       = str2nr(getftime(plugins_config_path))
	let timestamp_updated    = str2nr(getftime(plugins_updated_path))
	let timestamp_elapsed    = timestamp_now - timestamp_updated
	if timestamp_updated < timestamp_conf || timestamp_elapsed > 7 * 24 * 3600
		echo "init/plugins: Updating minpac"
		call minpac#update()
		call minpac#clean()
		call writefile([timestamp_now], plugins_updated_path)
		echo "input/plugins: Minpac updated"
	endif
endfunction

" @function Registers all the plugins declared in `plugins.list`
function plugins#register()
	let plugins_config_path = g:vim_config_path . "/init/plugins.list"
	if filereadable(plugins_config_path)
		" We have a list of plugins, we get them and add them
		let plugins_list = filter(readfile(plugins_config_path), 'v:val !~ "#"')
		for plugin in plugins_list
			call minpac#add(plugin, {'type':'opt'})
		endfor
	else
		echo "minpac: Edit the '" . plugins_config_path . "' file with a list of plugins to load"
		execute 'edit ' . fnameescape(plugins_config_path)
	endif
endfunction

" @function Loads all the plugins registered in minpack and loads their
" conifugration file if available.
function plugins#load()
	" NOTE: On first run, this will do
	" E919: Directory not found in 'packpath': "pack/*/opt/vim-mercenary"
	for plugin in keys(minpac#getpluglist())
		execute 'packadd ' . plugin
	endfor
	" TODO: If we had errors there, we should cleanup the .plugins.updated
	" file
endfunction

function plugins#configure()
	for plugin in keys(minpac#getpluglist())
		let plugin_path = g:vim_config_path . "/init/plugins/" . plugin . ".conf.vim"
		if filereadable(plugin_path)
			execute 'source ' . fnameescape(plugin_path)
		endif
	endfor
endfunction

function plugins#init()
	" Start by loading the list of plugins
	call plugins#register()
	" Now we update/cleanup the plugins
 	call plugins#autoupdate()
 	" We ask minpac to load all the plugins
 	call plugins#load()
	" We configure the plugins
 	call plugins#configure()
endfunction

" -----------------------------------------------------------------------------
" INIT
" -----------------------------------------------------------------------------

" We try to see if it's available now
if g:plugins_initialized==0
	" We initialize minpac
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})
	call plugins#init()
	let g:plugins_initialized=1
endif

" -----------------------------------------------------------------------------
" CUSTOM COMMANDS
" -----------------------------------------------------------------------------

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.

" @command Updates all registered packages
command! PluginsUpdate packadd minpac | call plugins#init()

" @command Cleans all installed packages
command! PluginsClean  packadd minpac | call minpac#clean()

" @command Lists the installed packages
command! PluginsList  packadd minpac | call minpac#getpluglist()

" EOF
