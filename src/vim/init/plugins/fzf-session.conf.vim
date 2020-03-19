" FROM: https://github.com/dominickng/fzf-session.vim
let g:fzf_session_path = $HOME . '.sessions'

" @binding Launches fzf prompt to search sessions with <leader>l.
nnoremap <leader>l :Sessions<CR>

" @binding Starts the prompt to save a session, awaiting a name to be entered.
nnoremap <leader>s :Session<Space>

" EOF 
