" -----------------------------------------------------------------------------
" KEYMAP
" -----------------------------------------------------------------------------

if has('Buffers')
	" @keymap Fuzzy-finder popup with opened buffers
	nmap     <C-P>               :Buffers<CR>
endif
"
if has('FZF')
	" @keymap Fuzz-finder popup with project files
	nmap     <C-Space>           :FZF<CR>
endif

if has('FZFTags')
	" @keymap Fuzz-finder popup with tags
	nmap     <C-T>               :FZFTags<CR>
endif

" EOF
