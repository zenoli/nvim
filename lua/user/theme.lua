local has_colorscheme_file = vim.fn.filereadable(vim.fn.expand("$XDG_CONFIG_HOME/nvim/.theme")) == 1
if  has_colorscheme_file then
    vim.cmd[[exec "colorscheme " .. split(system("cat $XDG_CONFIG_HOME/nvim/.theme"). '\n')[0] .. "-mod"]]
else
    -- Fallback
    vim.cmd[[colorscheme onedark]]
end
