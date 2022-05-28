" ============================================
" == GENERAL SETTINGS
" ============================================
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

" Resizing
noremap <C-W>- 5<C-W>-
noremap <C-W>+ 5<C-W>+
noremap <C-W>< 15<C-W><
noremap <C-W>> 15<C-W>>


" ============================================
" == PLUGINS
" ============================================
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

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

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1

" let g:indentLine_enabled = 0
let g:indentLine_fileType = ['lua', 'python']

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>

let g:vim_svelte_plugin_has_init_indent = 1

" ============================================
" == BINDINGS
" ============================================

" General mappings
let mapleader = " "
let maplocalleader = '\'

inoremap jk <ESC>
nnoremap q: <Nop>
nnoremap <expr> <Localleader>h ":vert bo h " . input("Help: ") . "\<CR>:vert resize 82\<CR>"
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap <Leader>s :% s/


" Unhighlight on Escape
nnoremap <silent> <ESC><ESC> :nohlsearch<CR><ESC>

" Swap ' and `
nnoremap ' `
nnoremap ` '

" Buffer navigation
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>
nnoremap <Leader>D :bp<bar>bd #<CR>

" Tab navigation
nnoremap ]t :tabnext<CR>
nnoremap [t :tabprevious<CR>

" Scrolling
nnoremap <C-j> 5<C-E>
nnoremap <C-k> 5<C-Y>

" Convenient pasting
nnoremap <Leader>pp "0p
nnoremap <Leader>PP "0P
nnoremap <Leader>pc $"+p
nnoremap <Leader>PC $"+P

" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

vnoremap <Leader>y "+y
nnoremap <Leader>vv _vg_

" Command mode bindings
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" Make Y behave like other capital commands.
nnoremap Y y$

" Just to beginning and end of lines easier.
noremap H ^
noremap L $

" Create newlines without entering insert mode
nnoremap go o<Esc>
nnoremap gO O<Esc>


" Edit config files
" VIM
nnoremap <leader>ve :e $MYVIMRC<cr>
nnoremap <leader>vE :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" TMUX
nnoremap <leader>te :e $HOME/.tmux.conf<cr>
nnoremap <leader>tE :vsplit $HOME/.tmux.conf<cr>

" ZSH
nnoremap <leader>ze :e $HOME/.zshrc<cr>
nnoremap <leader>zE :vsplit $HOME/.zshrc<cr>

" PYTHON
" Convert current string to pyton f-string
" augroup filetype_python
"     autocmd!
"     autocmd FileType python nnoremap <buffer> <Localleader>fs mrF"if<esc>`r 
" augroup END

" Close all windows except current one when vim is resized.
augroup custom_autocommands
    autocmd!
    autocmd VimResized * execute "normal! \<C-w>="
    autocmd BufNewFile,BufRead *.tmux set ft=tmux
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * call CocActionAsync('highlight')
augroup END


" Vimux 
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>
" map <Leader>qb :VimuxPromptCommand("qb ")<CR>

" Easymotion bindings
map  <Leader><Leader>j <Plug>(easymotion-overwin-line)
nmap s <Plug>(easymotion-overwin-f2)

" Calendar
let g:calendar_monday = 1
let g:calendar_no_mappings=1

" Fugitive
nnoremap <Leader>gg :Git<CR>
nnoremap <leader>gu :GitGutterToggle<CR>
nnoremap <leader>gc :Git checkout<space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gt :Git log --graph --oneline --all<CR>
nnoremap <Leader>g<Leader> :Git<Space>

" Gitgutter
set updatetime=50
let g:gitgutter_map_keys = 0

nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

" Fzf
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>c :Commands<CR>
nnoremap <Leader>B :Buffer<CR>
nnoremap <Leader>m :Maps<CR>
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>L :Lines<CR>
" nnoremap <Leader>t :BTags<CR>
" nnoremap <Leader>T :Tags<CR>
nnoremap <Leader>h :Helptags<CR>
nnoremap <Leader>H :History:<CR>
nnoremap <Leader>o :CocList outline<CR>
nnoremap <Leader>a :Ag<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Tabularize
vnoremap <Leader>t :Tabularize /

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <c-k> <esc>:m .-2<cr>==a
inoremap <C-J> <ESC>:m .+1<CR>==a

vnoremap > >gv
vnoremap < <gv
" ============================================
" == COC
" ============================================
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

nnoremap <space>e :CocCommand explorer<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gx <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> gH :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gD :call CocAction('jumpDefinition', 'vsplit')<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Toggle Diagnostics
nnoremap <silent> <Leader>C :call CocAction("diagnosticToggle")<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><nowait><expr> <M-n> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 5)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <M-p> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 5)\<cr>" : "\<Left>"

" ============================================
" == TREESITTER
" ============================================
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true -- false will disable the whole extension
  },
  incremental_selection = { enable = true }
}
EOF

" ============================================
" == VIMSPECTOR
" ============================================
" puremourning/vimspector
let g:vimspector_base_dir=expand( '$HOME/.vim/plugged/vimspector' )
fun! GotoWindow(id)
  :call win_gotoid(a:id)
endfun

func! AddToWatch()
  let word = expand("<cexpr>")
  call vimspector#AddWatch(word)
endfunction
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dq :call vimspector#Reset()<CR>
nnoremap <Leader>X :call vimspector#ClearBreakpoints()<CR>
nnoremap <Leader>b :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>db :call vimspector#ToggleConditionalBreakpoint()<CR>
nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <F10> <Plug>VimspectorToggleConditionalBreakpoint

let g:vimspector_sidebar_width = 50
let g:vimspector_terminal_maxwidth = 80
" let g:vimspector_sign_priority = {
"   \    'vimspectorBP':         998,
"   \    'vimspectorBPCond':     997,
"   \    'vimspectorBPDisabled': 996,
"   \    'vimspectorPC':         999,
"   \ }

" Custom mappings while debuggins
let s:mapped = {}

function! s:OnJumpToFrame() abort
  if has_key( s:mapped, string( bufnr() ) )
    return
  endif

  nmap <silent> <S-J> <Plug>VimspectorStepOver
  nmap <silent> <S-L> <Plug>VimspectorStepInto
  nmap <silent> <S-H> <Plug>VimspectorStepOut
  nmap <silent> [s <Plug>VimspectorUpFrame
  nmap <silent> ]s <Plug>VimspectorDownFrame
  nmap <silent> <buffer> E <Plug>VimspectorBalloonEval
  xmap <silent> <buffer> E <Plug>VimspectorBalloonEval

  nnoremap <silent> dr :call vimspector#Restart()<CR>
  nnoremap <silent> dn :call vimspector#Continue()<CR>
  nnoremap <silent> <buffer> dh :call vimspector#RunToCursor()<CR>
  nnoremap <silent> <buffer> da :call AddToWatch()<CR>

  nnoremap dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
  nnoremap dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
  nnoremap dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
  nnoremap ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
  nnoremap do :call GotoWindow(g:vimspector_session_windows.output)<CR>
  let s:mapped[ string( bufnr() ) ] = { 'modifiable': &modifiable }

  setlocal nomodifiable

endfunction

function! s:OnDebugEnd() abort

  let original_buf = bufnr()
  let hidden = &hidden

  try
    set hidden
    for bufnr in keys( s:mapped )
      try
        execute 'noautocmd buffer' bufnr
        silent! nunmap <S-J>
        silent! nunmap <S-L>
        silent! nunmap <S-H>
        silent! nunmap [s
        silent! nunmap ]s
        silent! nunmap <buffer> E
        silent! xunmap <buffer> E

        silent! nunmap dr
        silent! nunmap dn
        silent! nunmap <buffer> dh
        silent! nunmap <buffer> da

        silent! nunmap dc
        silent! nunmap dv
        silent! nunmap dw
        silent! nunmap ds
        silent! nunmap do

        let &l:modifiable = s:mapped[ bufnr ][ 'modifiable' ]
      endtry
    endfor
  finally
    execute 'noautocmd buffer' original_buf
    let &hidden = hidden
  endtry

  let s:mapped = {}
endfunction

augroup TestCustomMappings
  au!
  autocmd User VimspectorJumpedToFrame call s:OnJumpToFrame()
  autocmd User VimspectorDebugEnded call s:OnDebugEnd()
augroup END

" ============================================
" == ABBREVIATION
" ============================================
iab ms Microsoft
iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>
iabbrev cdate <C-R>=strftime("%a %b %d")<CR>

" ============================================
" == THEMEING
" ============================================
" color scheme
syntax on
set termguicolors

lua << END
require('lualine').setup()
END

let color_path = expand('~/.config/nvim/themes/$MY_THEME.vim')
if filereadable(color_path)
  exec 'source' color_path
else
  " Default color scheme
  colorscheme onedark
endif

" Set background to same color as the terminal
" highlight Normal guibg=NONE
" highlight NormalNC guibg=NONE
" highlight TabLine guibg=NONE
" highlight TabLineFill guibg=NONE
" highlight SignColumn guibg=NONE
" highlight StatusLineNC guibg=NONE
" highlight LineNr guibg=NONE
" highlight EndOfBuffer guibg=NONE

" ============================================
" == FZF
" ============================================

let g:fzf_layout = { 'down': '40%' }

hi! link fzf1 StatusLine
hi! link fzf2 StatusLine
hi! link fzf3 StatusLine

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
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

" Ranger
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1


nmap <space>ra :RnvimrToggle<CR>
