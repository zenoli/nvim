return {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
        require("catppuccin").setup {
            dim_inactive = {
                enabled = false,
                shade = "light",
                percentage = 0.15,
            },
            integrations = {
                neotree = true,
            },
        }
    end,
}
