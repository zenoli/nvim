source ./plugins.vim
source ./settings.vim

runtime! ./plug-configs/**/*.vim

let g:vim_svelte_plugin_has_init_indent = 1
let g:indentLine_fileType = ['lua', 'python']

" Resizing
noremap <C-W>- 5<C-W>-
noremap <C-W>+ 5<C-W>+
noremap <C-W>< 15<C-W><
noremap <C-W>> 15<C-W>>

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
nnoremap <leader>gc :Git checkout<space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gt :Git log --graph --oneline --all<CR>
nnoremap <Leader>g<Leader> :Git<Space>

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


" Ranger
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1


nmap <space>ra :RnvimrToggle<CR>
