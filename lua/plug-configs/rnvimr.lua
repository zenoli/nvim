return {
    "kevinhwang91/rnvimr",
    config = function()
        vim.cmd('source ~/.config/nvim/plug-configs/rnvimr.vim')
    end,
    run = "make sync"
}
