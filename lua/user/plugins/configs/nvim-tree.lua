return {
    "kyazdani42/nvim-tree.lua",
    requires = {
        "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly",
    config = function ()
        require "nvim-tree".setup({
            view = {
                adaptive_size = true,
                mappings = {
                    list = {
                        { key = "l", action = "edit" },
                        { key = "h", action = "close_node" },
                        -- { key = "v", action = "vsplit" },
                    },
                },
            },
            renderer = {
                indent_markers = {
                    enable = true
                },
                icons = {
                    glyphs = {
                        git = {
                            staged = "S",
                            unstaged = "U"
                        }
                    }
                }
            }
        })
        local map = require "user.utils".map
        map("n", "<leader>e", ":NvimTreeToggle<cr>")
    end
}
