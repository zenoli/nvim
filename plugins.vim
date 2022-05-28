" ============================================
" == PLUGINS
" ============================================
" Plugins will be downloaded under the specified directory.
call plug#begin('./plugins')

Plug 'benmills/vimux'
Plug 'yggdroot/indentline'
Plug 'kana/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'navarasu/onedark.nvim'
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'szw/vim-maximizer'
Plug 'godlygeek/tabular'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-rhubarb'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kevinoid/vim-jsonc'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'puremourning/vimspector'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'leafOfTree/vim-svelte-plugin'

call plug#end()
