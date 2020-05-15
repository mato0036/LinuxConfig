set nocompatible

syntax enable
filetype plugin on

" Change <Leader>
""let mapleader = ","

set splitright
set hidden          " Hide buffer when another is opened
set title           " Enable better title with file, mode and path

filetype plugin indent on   " Indent based on file type

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Indent 4 spaces
set expandtab       " tabs are spaces
set autoindent      " New lines inherit the indentation of previous lines.
set textwidth=120   " number of characters after that will be line broken

set ruler		" show cursor position
set showmatch       " not sure if using this
set splitbelow      " Always split buffer below
set splitright      " Apways split buffer on right side
set laststatus=2    " Always show statusline

" Display line numbers as distance from current line
set number          " Number of current line
set relativenumber  " Show distance of lines from current line
set cursorline      " Highlight current line

set backspace=eol,start,indent      " Configure backspace to act better

" Ignore case when seraching, use it only when searching both case
set ignorecase
set smartcase

" Highlighting search
set hlsearch        " Highlight as characters are writen"
set incsearch       " Hightlight match


""filetype plugin on

" Autosave - save file when focus is lost
""au FocusLost * :wa
""augroup OmniCompletionSetup
""    autocmd!
""    autocmd FileType c          set omnifunc=ccomplete#Complete
""    autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
""    autocmd FileType python     set omnifunc=python3complete#Complete
""    autocmd FileType ruby       set omnifunc=rubycomplete#Complete
""    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
""    autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
""    autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
""    autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
""augroup END


set t_Co=256
set termguicolors
""let ayucolor="dark"
""colorscheme ayu
colorscheme darkburn
"colorscheme spacecamp_lite


" Make comments italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic


" --------------------- FINDING FILES ---------------------
" Search recursive to [sub][sub]folders
"set path+=**

" Display all matching files to tab complete
set wildmenu


" --------------------- TAGS ---------------------
" Create the 'tags' file
command! MakeTags !ctags -R . 
" Set path to my generated system tags (mostly C)
set tags+=~/.vim/systags
" ^] to jump to tag under cursor
" g^] for ambiguous tags
" ^t tu jump back up the tag stack


" --------------------- AUTOCOMPLETE ---------------------
" ^x^n for JUST this file
" ^x^f for filenames
" ^x^] for tags
" ^n for anything to complete
" ^e for exit autocomplete and stay in insert mode


" --------------------- FILE BROWSING ---------------------
"  :h netrw-browse-maps
let g:netrw_banner=0			" disable banner
let g:netrw_browse_split=4		" open in prior window
let g:netrw_altv=1			" open splits to the right



" --------------------- MACROS ---------------------
"  Insert second pair, depend if pressed <CR> or not
inoremap {<CR> {<CR>}<Esc>O
inoremap { {}<Esc>i
inoremap {; {<CR>};<Esc>O
" insert second symbol and put input in the middle + features
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i
inoremap [; [<CR>];<Esc>O
" comment actual line
map <C-/>/ <Esc>I//<Esc>
" Newline
nnoremap <C-j> o<ESC>k
nnoremap <C-k> O<ESC>j
" Jump to end of parenthesis/brackets/quotes
inoremap <C-e> <C-o>A

nnoremap <leader><space> :noh<CR>



" Map Tab as Esc
" https://vim.fandom.com/wiki/Avoid_the_escape_key
"nnoremap <Tab> <Esc>
"" gV prevent automatic reselection
"vnoremap <Tab> <Esc>gV  
"onoremap <Tab> <Esc>
"cnoremap <Tab> <C-C><Esc>
"" `^ restores cursor position
"inoremap <Tab> <Esc>`^
"" Use normal tab 
"inoremap <Leader><Tab> <Tab>
"" Clean searched highlighted words
"nnoremap <leader><space> :noh<cr>
