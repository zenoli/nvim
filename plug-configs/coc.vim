" ============================================
" == COC
" ============================================

" = SETTINGS =

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

augroup coc-augroup
    autocmd!
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * call CocActionAsync('highlight')
augroup END


" = BINDINGS = 

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

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

nnoremap <Leader>o :CocList outline<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


" Toggle coc-explorer
nnoremap <space>e :CocCommand explorer<CR>

" Toggle Diagnostics
nnoremap <silent> <Leader>C :call CocAction("diagnosticToggle")<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><nowait><expr> <M-n> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 5)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <M-p> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 5)\<cr>" : "\<Left>"
