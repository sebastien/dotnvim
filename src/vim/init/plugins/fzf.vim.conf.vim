" SEE: https://github.com/junegunn/fzf/wiki/Color-schemes
let $FZF_DEFAULT_OPTS = '--color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81 --color info:144,prompt:161,spinner:135,pointer:135,marker:118'
" Agu command to ignore VCS files
command! -bang -nargs=* Agu call fzf#vim#ag(<q-args>, '--skip-vcs-ignores', {'down': '~40%'}) 
" We use Ag and we respect the git ignore for listing files, otherwise we're
" going to traverse too many files.
let $FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'
let g:fzf_prefer_vim_terminal = 1
" EOF
