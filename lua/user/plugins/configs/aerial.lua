return {
    "stevearc/aerial.nvim",
    after = "nvim-lspconfig",
    config = function()
        local map = require("user.utils").map

        require("aerial").setup {
            backends = { "lsp", "treesitter", "markdown", "man" },
        }

        map("n", "<leader>o", "<cmd>AerialToggle<cr>")
        map("n", "{", "<cmd>AerialPrev<cr>")
        map("n", "}", "<cmd>AerialNext<cr>")
    end,
}
