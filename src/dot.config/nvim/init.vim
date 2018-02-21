set shell=/bin/bash

call plug#begin('~/.config/nvim/plugged')

" Color scheme
Plug 'altercation/vim-colors-solarized'

" Misc. plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rking/ag.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'sbdchd/neoformat'

Plug 'benekastah/neomake'

" Language plugins
Plug 'fatih/vim-go'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-markdown'
Plug 'rust-lang/rust.vim'

" All of your Plugs must be added before the following line
call plug#end()

filetype plugin indent on

" ==========================================
" General config
" ==========================================

syntax enable " Turn on syntax highlighting
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

set hidden " Leave hidden buffers open

set mouse=a
set guicursor=

set clipboard=unnamed " Using system copy/paste register

set number " Enable line numbers

set expandtab " Tab -> spaces
set tabstop=2 " Tab shows as two columns wide
set shiftwidth=2 " How many spaces to indent text with
set softtabstop=2 " How many columns to insert when I press tab

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

" ==========================================
" Command mapping
" ==========================================

let mapleader=','

" Substitute
nnoremap <leader>s :%s//g<left><left>

" ag search
map <leader>a :Ag<space>

" Splits
map <leader>v :vs<CR>
map <leader>h :sp<CR>

" Make Y behave like C and D
map Y y$

" Shortcut for removing search highlight
nnoremap <Esc> :nohl<Cr>

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

" Search word under cursor
nmap <silent> <C-f> :Ag "<cword>"<CR>

" Save a protected file
cmap w!! w !sudo tee % >/dev/null

" ==========================================
" Airline
" ==========================================

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" ==========================================
" NERDTree
" ==========================================

map <C-n> :NERDTreeToggle<CR>

" Make NERDTree close when you open a file from it. Helps recover screen space!
let NERDTreeQuitOnOpen=1

" Disable netrw's autocmd, since we're ALWAYS using NERDTree
runtime plugin/netRwPlugin.vim
augroup FileExplorer
  au!
augroup END

" ==========================================
" neoformat
" ==========================================

let g:neoformat_enabled_elixir = ['mixformat']
let g:neoformat_verbose = 0

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" ==========================================
" vim-go
" ==========================================

let g:go_fmt_command = "gofmt"

" ==========================================
" The Silver Searcher - https://robots.thoughtbot.com/faster-grepping-in-vim
" ==========================================

let g:ctrlp_show_hidden = 1
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

