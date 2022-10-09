return {
    "j-hui/fidget.nvim",
    config = function()
        require("fidget").setup{
            sources = {
                ["null-ls"] = {
                    ignore = true,
                },
            },
        }
    end,
}
