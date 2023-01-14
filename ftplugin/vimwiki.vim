map <buffer> <localleader>t <Plug>VimwikiToggleListItem

noremap <buffer> <localleader><Localleader>t <cmd>VimwikiTOC<cr>
noremap <buffer> <localleader>b <cmd>Vimwiki2HTMLBrowse<cr>

map <buffer> [d <Plug>VimwikiDiaryPrevDay
map <buffer> ]d <plug>VimwikiDiaryNextDay
map <buffer> <C-x> <plug>VimwikiSplitLink
map <buffer> <C-v> <plug>VimwikiVSplitLink
map <buffer> gd <plug>VimwikiFollowLink

setlocal nowrap
