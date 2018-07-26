" =============================================================================
" FOLLOW SYMLINKS
" =============================================================================
"
" FROM: https://www.reddit.com/r/vim/comments/1x5rhh/how_to_follow_symlinks/
" Sources:
" - https://github.com/tpope/vim-fugitive/issues/147#issuecomment-7572351
" - http://www.reddit.com/r/vim/comments/yhsn6/is_it_possible_to_work_around_the_symlink_bug/c5w91qw

" @function Resolves and follow the given (or current) path so that is does not have any symlink.
function! SymlinksFollow(...)
	if exists('w:no_follow_symlinks') && w:no_follow_symlinks
		return
	endif
	" SEE: http://vim.wikia.com/wiki/Get_the_name_of_the_current_file
	let fname = a:0 ? a:1 : expand('%')
	if fname =~ '^\w\+:/'
		" do not mess with 'fugitive://' etc
		return
	endif
	let fname        = simplify(fname)
	let resolvedfile = resolve(fname)
	if resolvedfile == fname
		return
	endif
	" let resolvedfile = fnameescape(resolvedfile)
	" bwipeout
	" exec 'edit! "' . resolvedfile . '"'
	"silent! let s:fname = resolve(expand('%:p'))
	silent! let s:fname = fnameescape(resolvedfile)
	silent! bwipeout
	silent! exec "edit "   . s:fname
	" NOTE: We need to trigger the autocommands
	exec ':do BufRead '    . s:fname
endfunction

function! SymlinksToggle()
	let w:no_follow_symlinks = !get(w:, 'no_follow_symlinks', 0) | echo "w:no_follow_symlinks =>" w:no_follow_symlinks
endfunction

" @autocommand Automatically resolves and follows symlinks on file read
au BufReadPost * call SymlinksFollow(expand('<afile>'))

" @command Enables or disables the following of symlinks
command!	ToggleFollowSymlinks call SymlinksToggle()

" EOF
