set shell=/bin/bash

call plug#begin('~/.local/share/nvim/plugged')

" Color scheme
Plug 'altercation/vim-colors-solarized'

" Misc. plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-mix-format'
Plug 'editorconfig/editorconfig-vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'JazzCore/ctrlp-cmatcher'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'sbdchd/neoformat'
Plug 'fatih/vim-hclfmt'

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
nnoremap <leader>s :%s//<left><left>

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

" let g:neoformat_enabled_elixir = ['mixformat']
" let g:neoformat_verbose = 0

" augroup fmt
"  autocmd!
"  autocmd BufWritePre * undojoin | Neoformat
" augroup END

let g:mix_format_on_save = 1
let g:mix_format_options = '--check-equivalent'

" ==========================================
" vim-go
" ==========================================

let g:go_fmt_command = "gofmt"

" ==========================================
" FZF
" ==========================================

nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>p :History<CR>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" ==========================================
" Ag
" ==========================================

if executable('ag')
  " Use ag over grep
  set grepprg = "ag --nogroup --nocolor"
  let g:ackprg = "ag --nogroup --nocolor --column"
endif

