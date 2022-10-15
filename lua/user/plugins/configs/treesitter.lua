return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    cmd = {
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
        "TSDisableAll",
        "TSEnableAll",
    },
    config = function()
        require "nvim-treesitter.configs".setup {
            ensure_installed = {
                "lua",
                "python",
                "java",
                "typescript",
                "javascript",
                "svelte",
                "vim",
                "bash",
                "css"
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
