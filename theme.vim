" ============================================
" == THEMEING
" ============================================

" = SETTINGS =
let color_path = g:nvim_home . expand('/themes/$MY_THEME.vim')
if filereadable(color_path)
  exec 'source' color_path
else
  " Default color scheme
  colorscheme onedark
endif
