" FIXME: This triggers a super slow load time, see: nvim -V10nvim.log
" @feature Editor: Universal clipboard
set clipboard+=unnamedplus

" SEE: https://vi.stackexchange.com/questions/12376/vim-on-wsl-synchronize-system-clipboard-set-clipboard-unnamed
" let s:clip = '/mnt/c/Windows/System32/clip.exe'
" if executable(s:clip)
"     augroup WSLYank
"         autocmd!
"         autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
"     augroup END
" end
