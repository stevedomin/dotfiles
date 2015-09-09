set shell=/bin/bash

call plug#begin('~/.nvim/plugged')

Plug 'gmarik/Vundle.vim'

" Color scheme
Plug 'altercation/vim-colors-solarized'

" Misc. plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rking/ag.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'JazzCore/ctrlp-cmatcher'

" Language plugins
Plug 'fatih/vim-go'
Plug 'elixir-lang/vim-elixir'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-markdown'
Plug 'rust-lang/rust.vim'

" All of your Plugs must be added before the following line
call plug#end()

filetype plugin indent on

syntax enable " Turn on syntax highlighting
set background=dark
colorscheme solarized

set hidden " Leave hidden buffers open

set clipboard=unnamed " Using system copy/paste register

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

set cursorline " Highlight the cursor line

set nowrap " Don't wrap lines
set colorcolumn=81,121

set noswapfile
set nobackup
set nowritebackup

set gdefault " /g flag on substitutions

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set wildignore+=*.o,*.obj,*/.git/*,*/.hg/*,*/.svn/*,*.pyc,*/node_modules/*

" Syntax highlighting is slower with the new engine
set regexpengine=1

" Mapping
let mapleader=','

" Substitute
nnoremap <leader>s :%s//g<left><left>

" ag search
map <leader>a :Ag<space>

" Splits
map <leader>v :vs<CR>
map <leader>h :sp<CR>

" Save with ctrl-s
map <C-s> <Esc>:w<CR>
imap <C-s> <Esc>:w<CR>

" Better vim splitting
" From http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Emacs-style start and end of line
" In insert mode
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A
" In command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Never go in Ex mode again
nnoremap Q <nop>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" vim-go
let g:go_fmt_command = "gofmt" " Use goimports instead of gofmt

let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" The Silver Searcher - https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

