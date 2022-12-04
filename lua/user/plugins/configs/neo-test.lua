return {
    "nvim-neotest/neotest",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "haydenmeade/neotest-jest",
        "marilari88/neotest-vitest",
    },
    config = function()
        require("neotest").setup {
            adapters = {
                require "neotest-jest",
                require "neotest-vitest",
            },
            output = {
                open_on_run = "short",
            },
        }

        vim.cmd [[
            command! NeotestSummary lua require("neotest").summary.toggle()
            command! NeotestFile lua require("neotest").run.run(vim.fn.expand("%"))
            command! Neotest lua require("neotest").run.run(vim.fn.getcwd())
            command! NeotestNearest lua require("neotest").run.run()
            command! NeotestDebug lua require("neotest").run.run({ strategy = "dap" })
            command! NeotestAttach lua require("neotest").run.attach()
        ]]
    end,
}
