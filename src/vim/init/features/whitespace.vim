" @feature Highlights trailing whitespace
" SEE: http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim
syn match TrailingWhitespace /\s\+$/
syn match NonASCII           "[^\x00-\x7F]"
autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingWhitespace /\s\+$/
autocmd BufWinEnter * match NonASCII           "[^\x00-\x7F]"
autocmd InsertEnter * match NonASCII           "[^\x00-\x7F]"
autocmd InsertLeave * match NonASCII           "[^\x00-\x7F]"
autocmd BufWinLeave * call clearmatches()


" @feature Show columns
set colorcolumn=4,8,12,80
