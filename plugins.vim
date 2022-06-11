" ============================================
" == PLUGINS
" ============================================

" Plugins will be downloaded under the specified directory.
call plug#begin(g:nvim_home . '/plugged')

" Themes
Plug 'navarasu/onedark.nvim'
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'
Plug 'NLKNguyen/papercolor-theme'

" Visual aids
Plug 'yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'nvim-lualine/lualine.nvim'

" Git
Plug 'tpope/vim-fugitive' 
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'benmills/vimux'

" Organizational
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

" Quality of life
Plug 'kana/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'szw/vim-maximizer'
Plug 'godlygeek/tabular'

"Various
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kevinoid/vim-jsonc'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'puremourning/vimspector'
Plug 'leafOfTree/vim-svelte-plugin'

call plug#end()

exec "source " g:nvim_home . "/plug-configs/calendar.vim"
exec "source " g:nvim_home . "/plug-configs/coc.vim"
exec "source " g:nvim_home . "/plug-configs/easymotion.vim"
exec "source " g:nvim_home . "/plug-configs/fugitive.vim"
exec "source " g:nvim_home . "/plug-configs/fzf.vim"
exec "source " g:nvim_home . "/plug-configs/gitgutter.vim"
exec "source " g:nvim_home . "/plug-configs/indentline.vim"
exec "source " g:nvim_home . "/plug-configs/lualine.vim"
exec "source " g:nvim_home . "/plug-configs/rnvimr.vim"
exec "source " g:nvim_home . "/plug-configs/tabularize.vim"
exec "source " g:nvim_home . "/plug-configs/treesitter.vim"
exec "source " g:nvim_home . "/plug-configs/vim-svelte-plugin.vim"
exec "source " g:nvim_home . "/plug-configs/vim-tmux-navigator.vim"
exec "source " g:nvim_home . "/plug-configs/vimspector.vim"
exec "source " g:nvim_home . "/plug-configs/vimux.vim"
