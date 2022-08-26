return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require "nvim-treesitter.configs".setup {
            ensure_installed = {
                "lua",
                "python",
                "typescript",
                "javascript"
            },
            highlight = {
                enable = true -- false will disable the whole extension
            },
            autotag = {
                enable = true
            },
            incremental_selection = { enable = true }
        }
    end,
    run = ":TSUpdate"
}
