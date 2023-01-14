return {
    "stevearc/aerial.nvim",
    wants = "nvim-lspconfig",
    config = function()
        local map = require("user.utils").map

        require("aerial").setup {
            backends = { "lsp", "treesitter", "markdown", "man" },
            on_attach = function(bufnr)
                map("n", "{", "<cmd>AerialPrev<cr>", { buffer = bufnr })
                map("n", "}", "<cmd>AerialNext<cr>", { buffer = bufnr })
            end
        }

        map("n", "<leader>o", "<cmd>AerialToggle<cr>")
    end,
}
