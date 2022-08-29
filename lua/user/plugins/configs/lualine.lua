return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup {
            options = {
                disabled_filetypes = {
                    statusline = { "neo-tree" },
                    winbar = {},
                },
                ignore_focus = { "neo-tree" }
            }
        }
    end
}
