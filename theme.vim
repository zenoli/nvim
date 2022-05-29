" ============================================
" == THEMEING
" ============================================

" = SETTINGS =
let color_path = expand('~/.config/nvim/themes/$MY_THEME.vim')
if filereadable(color_path)
  exec 'source' color_path
else
  " Default color scheme
  colorscheme onedark
endif
