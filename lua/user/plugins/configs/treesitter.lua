return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        vim.cmd('source ~/.config/nvim/plug-configs/treesitter.vim')
    end,
    run = ":TSUpdate"
}
