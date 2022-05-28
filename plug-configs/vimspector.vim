" ============================================
" == VIMSPECTOR
" ============================================

" = SETTINGS =
let g:vimspector_base_dir=expand( '$HOME/.vim/plugged/vimspector' )
let g:vimspector_sidebar_width = 50
let g:vimspector_terminal_maxwidth = 80

fun! GotoWindow(id)
  :call win_gotoid(a:id)
endfun

func! AddToWatch()
  let word = expand("<cexpr>")
  call vimspector#AddWatch(word)
endfunction

" = BINDINGS =
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dq :call vimspector#Reset()<CR>
nnoremap <Leader>X :call vimspector#ClearBreakpoints()<CR>
nnoremap <Leader>b :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>db :call vimspector#ToggleConditionalBreakpoint()<CR>
nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <F10> <Plug>VimspectorToggleConditionalBreakpoint


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
