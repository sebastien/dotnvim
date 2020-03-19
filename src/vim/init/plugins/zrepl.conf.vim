" FROM: <https://github.com/axvr/zepl.vim>
augroup zepl
	autocmd!
	autocmd FileType python     let b:repl_config = { 'cmd': 'python3' }
	autocmd FileType javascript let b:repl_config = { 'cmd': 'node' }
	autocmd FileType clojure    let b:repl_config = { 'cmd': 'clj' }
	autocmd FileType scheme     let b:repl_config = { 'cmd': 'rlwrap csi' }
	autocmd FileType lisp       let b:repl_config = { 'cmd': 'sbcl' }
	autocmd FileType julia      let b:repl_config = { 'cmd': 'julia' }
augroup END
