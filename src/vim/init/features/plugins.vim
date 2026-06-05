"" -----------------------------------------------------------------------------
" PACKAGE MANAGER
" -----------------------------------------------------------------------------
" We're using `vim.pack`, the builtin package manager for Neovim 0.12+.
" SEE: <https://neovim.io/doc/user/pack.html#vim.pack>
"
" {{{
"
" vim.pack Package Manager
" ========================
"
" Automatically loads and installs the plugins listed in
" `init/plugins.list`.
"
" ```shell
" $ cat ~/.config/nvim/init/plugins.list
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

let s:plugins_config_path = g:vim_config_path . '/init/plugins.list'
let g:plugins_initialized = get(g:, 'plugins_initialized', 0)

lua << EOF
local function build_blink(ev)
  local spec = ev.data and ev.data.spec
  if not spec or spec.name ~= 'blink.cmp' then
    return
  end
  if ev.data.kind ~= 'install' and ev.data.kind ~= 'update' then
    return
  end

  if not ev.data.active then
    vim.cmd.packadd('blink.cmp')
  end

  require('blink.cmp').build():pwait()
end

vim.api.nvim_create_autocmd('PackChanged', {
  callback = build_blink,
})
EOF

function! s:read_plugins() abort
	if !filereadable(s:plugins_config_path)
		echo "init/plugins: Edit the '" . s:plugins_config_path . "' file with a list of plugins to load"
		execute 'edit ' . fnameescape(s:plugins_config_path)
		return []
	endif
	return filter(map(readfile(s:plugins_config_path), 'trim(v:val)'), 'v:val !~ "^#" && v:val != ""')
endfunction

function! s:source_plugin_configs(plugins) abort
	for plugin in a:plugins
		let plugin_name = fnamemodify(plugin, ':t')
		let plugin_path = g:vim_config_path . '/init/plugins/' . plugin_name . '.conf.vim'
		if filereadable(plugin_path)
			execute 'source ' . fnameescape(plugin_path)
		endif
		let plugin_path = g:vim_config_path . '/init/plugins/' . plugin_name . '.conf.lua'
		if filereadable(plugin_path)
			execute 'source ' . fnameescape(plugin_path)
		endif
	endfor
endfunction

function! s:init_plugins() abort
	let plugins = s:read_plugins()
	if empty(plugins)
		return
	endif
	let g:dotvim_plugins = map(copy(plugins), '"https://github.com/" . v:val')
	lua vim.pack.add(vim.g.dotvim_plugins, { confirm = false, load = true })
	call s:source_plugin_configs(plugins)
endfunction

" -----------------------------------------------------------------------------
" INIT
" -----------------------------------------------------------------------------

if g:plugins_initialized==0
	call s:init_plugins()
	let g:plugins_initialized=1
endif

" -----------------------------------------------------------------------------
" CUSTOM COMMANDS
" -----------------------------------------------------------------------------

" Define user commands for updating/cleaning the plugins.

" @command Updates all registered packages
command! PluginsUpdate packupdate!

" @command Cleans all installed packages
command! PluginsClean  packdel ++all

" @command Lists the installed packages
command! PluginsList   lua vim.print(vim.pack.get(nil, { info = false }))

" EOF
