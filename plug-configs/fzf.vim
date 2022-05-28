" ============================================
" == FZF
" ============================================

" = SETTINGS =
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

" = BINDINGS =
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>c :Commands<CR>
nnoremap <Leader>B :Buffer<CR>
nnoremap <Leader>m :Maps<CR>
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>L :Lines<CR>
nnoremap <Leader>h :Helptags<CR>
nnoremap <Leader>H :History:<CR>
nnoremap <Leader>o :CocList outline<CR>
nnoremap <Leader>a :Ag<CR>
"
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

echom "FZF config loaded!!!"
