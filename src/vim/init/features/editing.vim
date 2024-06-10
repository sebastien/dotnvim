" =============================================================================
" FILES
" =============================================================================

" @feature Files: UTF-8 encoding by default
set encoding=utf-8

" =============================================================================
" EDITING
" =============================================================================

" @feature Editing: do not expand tabs to spaces
set noet
" @feature Editing: Tab stops at 4 spaces
set tabstop=4
" @feature Editing: Shifting by steps of 4 spaces (1 tab)
set shiftwidth=4
" @feature Editing: Wrap lines
set wrap
" @feature Editing: Show matching bracket
set showmatch
" @feature Editing: Hitting tab inserts spaces or tabs based on the configuration
set smarttab
" @feature Editing: Whitespace characters are visible
" set list listchars=tab:»-,trail:·,eol:¬,extends:¬,precedes:¬
 set list listchars=tab:▹―,trail:·,eol:¬,extends:¬,precedes:¬
" @feature Editing: Backspace works over indent and newlines
set backspace=indent,eol,start
" @feature Editing: Persistent undo (between sessions)
set undofile

" =============================================================================
" SEARCHING
" =============================================================================

" @feature Search: Highlight search expression matches
set hlsearch
" @feature Search: Searches while typing an expression
set incsearch
" @feature Search: Searces are case-insensitive by default
set noignorecase
" @feature Search: Live search and replace
" set inccommand=nosplit

" =============================================================================
" TERMINAL
" =============================================================================

" @feature Terminal: mouse supported
set mouse=a
" @feature Terminal: visual bell instead of beep
set visualbell
" @feature Terminal: 256 coor support
set t_Co=256

" =============================================================================
" EDITOR
" =============================================================================

" @feature Editor: Enables syntax plugins
syntax enable
" @feature Editor: Enables file type plugins and indentation
filetype plugin indent on
" @feature Editor: Folding is based on indentation
set foldmethod=indent
" @feature Editor: Folding level is up to 4
set foldlevel=4
" FIXME: Disabled as this triggers huge slowdowns when remoting
" @feature Editor: Shows the current cursor line
set cursorline
" " @feature Editor: Shows the current cursor column
" set cursorcolumn
" @feature Editor: We never want anything concealed on the current line
set concealcursor=
" @fix Editor: Command height needs to be 2 for error reporting
set cmdheight=2

" @feature Editor: Show line numbers
set number

" @feature Editor: no bell
set belloff=all

" =============================================================================
" PERFORMANCE
" =============================================================================

" @feature Performance: ensures faster drawing in terminal
set ttyfast
" @feature Performance: do not try to highlight past the 256-th column
set synmaxcol=256


" =============================================================================
" DIGRAPHS
" =============================================================================
"digraph cx ⨯

" EOF
