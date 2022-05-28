" ============================================
" == GITGUTTER
" ============================================

" = SETTINGS =
set updatetime=50
let g:gitgutter_map_keys = 0

" = BINDINGS =
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)
nnoremap <leader>gu :GitGutterToggle<CR>
