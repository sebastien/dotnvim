" -----------------------------------------------------------------------------
"
"      __   __   __     __    __     ______     ______    
"     /\ \ / /  /\ \   /\ "-./  \   /\  == \   /\  ___\   
"     \ \ \'/   \ \ \  \ \ \-./\ \  \ \  __<   \ \ \____  
"      \ \__|    \ \_\  \ \_\ \ \_\  \ \_\ \_\  \ \_____\ 
"       \/_/      \/_/   \/_/  \/_/   \/_/ /_/   \/_____/ 
" 
" -----------------------------------------------------------------------------
" URL:      https://bitbucket.com/sebastien/dotnvim
" Updated:  2018-03-13
" -----------------------------------------------------------------------------
" This .vimrc configuration file works with Vim8 and Neovim. It supports
" the following features:
"
" - As-you-type completion pop-up
" - Code snippets expansion with `Tab`
" - Automatic download and install of plugin manager
"
" Useful references:
" - A VimL tutorial <https://gist.github.com/averagehat/37f54eab2ce0810e4d63>
" - Learning VimScript the hard way <http://learnvimscriptthehardway.stevelosh.com/>
"
let g:vim_config_path=fnamemodify($MYVIMRC,':h')
let vim_init_features_path = g:vim_config_path . "/init/features.list" 
if !filereadable(vim_init_features_path)
	echo "init.vim: Edit the '" . vim_init_features_path . "' file with a list of features to load"
else
	let features_list = filter(readfile(vim_init_features_path), 'v:val !~ "#"')
	for feature in features_list
		let feature_path = g:vim_config_path . '/init/features/' . feature . '.vim'
		if !filereadable(feature_path)
			echo "init.vim: Cannot find feature '" . feature . "' init script: " . fnameescape(feature_path)
		else
			:execute 'source ' . fnameescape(feature_path)
		end
	endfor
endif

" EOF
