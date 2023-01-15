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
               enable = true,
                disable = function(_, bufnr)
                    local LINE_NR_THRESH = 1000
                    local is_large_file = vim.api.nvim_buf_line_count(bufnr) > LINE_NR_THRESH
                    if is_large_file then
                        -- vim.cmd[[syntax off]]
                        vim.cmd[[IndentBlanklineDisable]]
                        -- vim.cmd[[DapVirtualTextDisable]]
                        vim.opt_local.spell = false
                    end
                    return is_large_file
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
