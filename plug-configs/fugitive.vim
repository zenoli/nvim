" ============================================
" == FUGITIVE
" ============================================

" = BINDINGS = 
nnoremap <Leader>gg :Git<CR>
nnoremap <leader>gc :Git checkout<space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gt :Git log --graph --oneline --all<CR>
nnoremap <Leader>g<Leader> :Git<Space>

" Resolving merge conflicts
nnoremap <Leader>th :diffget //2 <CR>
nnoremap <Leader>tl :diffget //3 <CR>
