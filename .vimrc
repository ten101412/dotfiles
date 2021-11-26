" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣀⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣴⣿⣿⠿⣫⣥⣄⠄⠄⠄⠄⠄⠄⠄⠄⠄
" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⠄⠄⠄⠾⢿⢟⣵⣾⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄
" ⠄⠄⠄⠄⠄⠄⠄⠄⣰⡿⣀⣤⣴⣾⣿⡇⠙⠛⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
" ⠄⠄⠄⠄⠄⠄⣠⣾⣿⣿⣿⣿⣿⣿⣿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
" ⠄⠄⠄⠄⠄⣴⣿⣿⠿⠛⠉⢩⣿⣿⡇⠄⠄⠄⠄⠄⠄⠄⠄⣀⣀⡀⠄⠄⠄⠄
" ⠄⠄⠄⠄⠈⠛⠉⠄⠄⠄⠄⢸⣿⣿⡇⠄⠄⠄⠄⠄⠄⢀⣼⡿⣫⣾⠆⠄⠄⠄
" ⠄⠄⠄⠄⢀⣶⣶⣶⣶⣶⣶⣿⣿⣿⠇⠄⠄⠄⣠⣎⣠⣴⣶⠎⠛⠁⠄⠄⠄⠄
" ⠄⠄⠄⠄⣾⣿⣿⣿⣿⠿⠿⠟⠛⠋⠄⠄⢀⣼⣿⠿⠛⣿⡟⠄⠄⠄⠄⠄⠄⠄
" ⠄⠄⠄⠄⠛⠉⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⠉⠄⠄⢸⣿⡇⠄⠄⠄⠄⠄⠄⠄
" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣼⣿⣿⣿⡿⠿⠃⠄⠄⠄⠄⠄⠄⠄
" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠋⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄

"-------------------------------------------------------------
" => Required for Plug-ins
"-------------------------------------------------------------
set nocompatible                  " Set compatibility to Vim only   
filetype off                      " Helps force plug-ins to load correctly when it is turned back on below.
filetype plugin on                " For plug-ins to load correctly.
filetype indent on

"-------------------------------------------------------------
" => Plugins & Themes
"-------------------------------------------------------------
call plug#begin('~/.vim/plug')
    Plug 'artanikin/vim-synthwave84'
    Plug 'morhetz/gruvbox' 
    Plug 'cocopon/iceberg.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-eunuch'
    Plug 'preservim/nerdtree'
    Plug 'vim-syntastic/syntastic'
call plug#end()

"------------------------------> Themes
set term=xterm-256color
if has('termguicolors')
    set termguicolors
endif
" colorscheme synthwave84 

"------------------------------> NERDTree
" Keymap = Ctrl + k
" Uncomment to start NERDTree upon opening vim + Move cursor back to vim
" autocmd VimEnter * NERDTree | wincmd p

"------------------------------> Syntastic
" Keymap = Ctrl + s
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"--------------------------------------------------------------
" => General Settings
"--------------------------------------------------------------
syntax on                         " Turn on syntax highlighting
set modelines=0                   " Turn off modelines
set wrap                          " Automatically wrap text that extends beyond the screen length.
set wildmenu                      " Displays all matches when tab complete
set number                        " Shows Line Numbers
set backspace=indent,eol,start    " Fixes common delete problems
set scrolloff=6                   " Number of lines to show above/below screen at edge of screen
set ttyfast                       " Faster Scrolling
set matchpairs+=<:>               " Highlight matching brackets
set nolist
set encoding=utf-8                " Encoding

" To fold, enter visual mode + zf
set foldenable                    " Allows for folding lines
set foldmethod=indent
"  Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

"  Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

"-------------------------------------------------------------
" => Keymap
"-------------------------------------------------------------
"  Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
"  Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
map <C-k> :NERDTreeToggle<CR>
map <C-s> :SyntasticCheck<CR>

"------------------------------------------------------------
" => Text, Tab, Indent
"------------------------------------------------------------
set formatoptions=tcqrn1
set tabstop=4                     " One tab == four spaces
set shiftwidth=4                  " One tab == four spaces
set softtabstop=2
set expandtab                     " Use spaces instead of tabs
set smarttab

"-------------------------------------------------------------
" => Status Line
"-------------------------------------------------------------
set laststatus=2                  " Always Shows Status Line
set noshowmode                    " Gets rid of normal-mode to show under status line
set showcmd                       " Show commands
" Set status line display (Unnecessary due to lightline)
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Lightline Plugin
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"------------------------------------------------------------
" => Search Patterns
"------------------------------------------------------------
set hlsearch                      " Highlight patterns 
set incsearch                     " Incremental search
set ignorecase                    " Includes capitals in search
set smartcase                     " Capitals searched when search is a capital
