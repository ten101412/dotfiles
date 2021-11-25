"-------------------------------------------------------------
" => Required for Plug-ins
"-------------------------------------------------------------
set nocompatible                  " Set compatibility to Vim only   
filetype off                      " Helps force plug-ins to load correctly when it is turned back on below.
filetype plugin on         " For plug-ins to load correctly.
filetype indent on

"-------------------------------------------------------------
" => Plug-ins & Themes
"-------------------------------------------------------------
call plug#begin('~/.vim/plug')
    Plug 'artanikin/vim-synthwave84'
    Plug 'morhetz/gruvbox'
    Plug 'cocopon/iceberg.vim'
call plug#end()

"set termguicolors
"colorscheme synthwave84 
"--------------------------------------------------------------
" => General Settings
"--------------------------------------------------------------
syntax on                         " Turn on syntax highlighting
set modelines=0                   " Turn off modelines
set wrap                          " Automatically wrap text that extends beyond the screen length.
set wildmenu                      " Displays all matches when tab complete
set number                        " Shows Line Numbers

"-------------------------------------------------------------
" => Keymap
"-------------------------------------------------------------
"  Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

"------------------------------------------------------------
" => Text, Tab, Indent
"------------------------------------------------------------
set formatoptions=tcqrn1
set tabstop=4                  " One tab == four spaces
set shiftwidth=4               " One tab == four spaces
set softtabstop=2
set expandtab                  " Use spaces instead of tabs
set smarttab

"-------------------------------------------------------------
" => Status Line
"-------------------------------------------------------------

" Always show statusline
set laststatus=2
" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode


"  Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
"  Fixes common backspace problems
set backspace=indent,eol,start

"  Speed up scrolling in Vim
set ttyfast

"  Display options
set showmode
set showcmd

"  Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

"  Display different types of white spaces.
set nolist

"  Show line numbers

"  Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

"  Encoding
set encoding=utf-8

"  Highlight matching search patterns
set hlsearch
"  Enable incremental search
set incsearch
"  Include matching uppercase words with lowercase search term
set ignorecase
"  Include only uppercase words with uppercase search term
set smartcase

"  Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

"  Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"  Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"
