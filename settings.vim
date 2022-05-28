" ============================================
" == GENERAL SETTINGS
" ============================================
" General mappings
let mapleader = " "
let maplocalleader = '\'

set nocompatible
set cursorline
filetype plugin on
syntax on

set number relativenumber
set timeoutlen=1000 ttimeoutlen=10
set hidden
set mouse=a
set wildmenu     " Display available commands when pressing TAB in command mode.

set showcmd
set splitbelow
set splitright
set noswapfile

set showtabline=2
set guioptions-=e
set laststatus=2

set t_Co=256     " Use 256 colours (Use this setting only if your terminal supports 256 colours)

" Indentation
set autoindent   " use indentation of previous line
set smartindent  " use intelligent indentation
set smarttab

" tab settings using hard tabs
set tabstop=4    " tab width is 4 spaces
set shiftwidth=4 " indent also with 4 spaces
set expandtab

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Scrolling
set scrolloff=5
