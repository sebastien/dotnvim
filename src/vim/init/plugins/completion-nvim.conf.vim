" SEE: https://github.com/nvim-lua/completion-nvim

" SEE: https://github.com/steelsojka/completion-buffers
" SEE: https://github.com/nvim-treesitter/completion-treesitter
let g:completion_chain_complete_list = {
\'default' : {
\	'default' : [
\		{'complete_items' : ['lsp', 'buffers', 'snippet', 'ts']},
\		{'mode' : 'file'}
\	],
\	'comment' : [],
\	'string' : []
\	}
\}

autocmd BufEnter * lua require'completion'.on_attach()
