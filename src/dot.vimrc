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
set backspace=indent,eol,start "Allow backspacing over everything in insert mode

set incsearch " Search as you type
set ignorecase " Case insensitive searches
set smartcase " Case sensitive searches when uppercase characters are used

set showmatch " Highlight matching bracket

set mouse=a " Enable mouse in all modes
set ttymouse=xterm2

set cursorline " Highlight the cursor line

set textwidth=80
set colorcolumn=+1

set noswapfile " No swap files

set laststatus=2 " For airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:go_fmt_command = "goimports" " Use goimports instead of gofmt


