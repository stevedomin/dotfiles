set nocompatible " be iMproved
set shell=/bin/bash
set encoding=utf-8

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Color scheme
Bundle 'altercation/vim-colors-solarized'

" Misc. plugins
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'

" Language plugins
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable " Turn on syntax highlighting
set background=dark
colorscheme solarized

set hidden " Leave hidden buffers open

set history=1000 " By default Vim saves your last 8 commands

set number " Enable line numbers

set expandtab " Tab -> spaces
set tabstop=2 " Tab shows as two columns wide
set shiftwidth=2 " How many spaces to indent text with
set softtabstop=2 " How many columns to insert when I press tab
set backspace=indent,eol,start "Allow backspacing over everything in insert mode

set incsearch " Search as you type
set ignorecase " Case insensitive searches
set smartcase " Case sensitive searches when uppercase characters are used

set showmatch " Highlight matching bracket

set mouse=a " Enable mouse in all modes
set ttymouse=xterm2

set cursorline " Highlight the cursor line

set textwidth=120 " Text column size
set nowrap " Don't wrap lines
set colorcolumn=+1

set noswapfile " No swap files
set backup " Make backup files
set backupdir=~/.vim/backup " Location of backup files 

" Emacs-style start and end of line
inoremap <c-a> <esc>I " In insert mode
inoremap <c-e> <esc>A
cnoremap <c-a> <home> " In command mode
cnoremap <c-e> <end>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Better vim splitting
" From http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Airline
set laststatus=2 " Always show status line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" vim-go
let g:go_fmt_command = "goimports" " Use goimports instead of gofmt

