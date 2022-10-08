-- vim.cmd "colorscheme $MY_THEME-mod"
vim.cmd[[exec "colorscheme " .. split(system("cat $XDG_CONFIG_HOME/nvim/.theme"). '\n')[0] .. "-mod"]]
