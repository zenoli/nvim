" ============================================
" == KEYBINDINGS
" ============================================
" Non-plugin related keybindings

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

" " Buffer navigation
" nnoremap ]b :bn<CR>
" nnoremap [b :bp<CR>
" nnoremap <Leader>D :bp<bar>bd #<CR>

" Tab navigation
" nnoremap ]t :tabnext<CR>
" nnoremap [t :tabprevious<CR>

" Scrolling
" nnoremap <C-j> 5<C-E>
" nnoremap <C-k> 5<C-Y>

" " Convenient pasting
" nnoremap <Leader>pp "0p
" nnoremap <Leader>PP "0P
" nnoremap <Leader>pc $"+p
" nnoremap <Leader>PC $"+P

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
" nnoremap Y y$

" Jump to beginning and end of lines easier.
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

