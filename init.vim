let nvim_home = $XDG_CONFIG_HOME . "/nvim"

exec "source " nvim_home . "/plugins.vim"
exec "source " nvim_home . "/settings.vim"
exec "source " nvim_home . "/abbreviations.vim"
exec "source " nvim_home . "/keybindings.vim"

runtime! plug-configs/**/*.vim

exec "source " nvim_home . "/theme.vim"

