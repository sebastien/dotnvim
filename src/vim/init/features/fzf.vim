" Agu command to ignore VCS files
command! -bang -nargs=* Agu call fzf#vim#ag(<q-args>, '--skip-vcs-ignores', {'down': '~40%'}) 
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'
let g:fzf_prefer_vim_terminal = 1

