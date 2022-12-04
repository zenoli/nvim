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
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "lua",
                "python",
                "java",
                "typescript",
                "javascript",
                "svelte",
                "vim",
                "bash",
                "css",
            },
            indent = {
                enable = true,
                disable = { "python" },
            },
            highlight = {
                enable = true, -- false will disable the whole extension
                is_supported = function()
                    if
                        vim.fn.strwidth(vim.fn.getline ".") > 300
                        or vim.fn.getfsize(vim.fn.expand "%") > 1024 * 1024
                    then
                        return false
                    else
                        return true
                    end
                end,
            },
            autotag = {
                enable = true,
            },
            incremental_selection = { enable = true },
        }
    end,
    run = ":TSUpdate",
}
