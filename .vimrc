set nocompatible

syntax enable
filetype plugin on

set splitright
set hidden          " Hide buffer when another is opened
set title           " Enable better title with file, mode and path

filetype plugin indent on   " Indent based on file type
filetype plugin on

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Indent 4 spaces
set expandtab       " tabs are spaces
"set autoindent      " New lines inherit the indentation of previous lines.
set smartindent     " Automatically inserts one extra indent in some cases
set textwidth=110   " number of characters after that will be line broken
set shiftround      " indent to the next multiple of shiftwidth

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

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P


autocmd FileType tex set tw=80


set t_Co=256
set termguicolors
let ayucolor="dark"
colorscheme ayu


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


" --------------------- FILE BROWSING ---------------------
"  :h netrw-browse-maps
let g:netrw_banner=0			" disable banner
let g:netrw_browse_split=4		" open in prior window
let g:netrw_altv=1			" open splits to the right

" --------------------- PLUGINS ---------------------------
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ycm-core/YouCompleteMe'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'StanAngeloff/php.vim'
Plug 'chrisbra/matchit'
Plug 'junegunn/vim-peekaboo'

" Initialize plugin system
call plug#end()

let g:ycm_language_server = [
    \   {
    \     'name': 'haskell-language-server',
    \     'cmdline': [ 'haskell-language-server-wrapper', '--lsp' ],
    \     'filetypes': [ 'haskell', 'lhaskell' ],
    \     'project_root_files': [ 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml' ],
    \   },
    \ ]

let g:ycm_gloabal_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
map <leader>g  :YcmCompleter GoTo<CR>

" --------------------- MACROS ---------------------
"  Split navigation
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"  Insert second pair, depend if pressed <CR> or not
inoremap {<CR> {<CR>}<Esc>O
inoremap { {}<Esc>i
inoremap {; {<CR>};<Esc>O
" Don't put closing bracket
inoremap {{ {
inoremap {} {}
inoremap (( (
inoremap () ()
" Insert second symbol and put input in the middle + features
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap [; [<CR>];<Esc>O
" Skip closing bracket when it is right next to cursor
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
" Insert two quotes or skip closing quote, similar to this ^^^
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
" Comment line (CTRL-/)
nnoremap <C-_> I//<Esc>
" Newline
nnoremap <C-j> o<ESC>k
nnoremap <C-k> O<ESC>j
" Jump to end of parenthesis/brackets/quotes
inoremap <C-e> <Esc>A
" No highlight
nnoremap <leader><space> :noh<CR>
" Close tag with omnicompletion and move in front of closing tag
imap ,/ </<C-X><C-O><C-X><ESC>F<i
