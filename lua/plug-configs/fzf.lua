return {
    "junegunn/fzf.vim",
    config = function()
        vim.cmd('source ~/.config/nvim/plug-configs/fzf.vim')
    end,
    requires = "junegunn/fzf"
}
