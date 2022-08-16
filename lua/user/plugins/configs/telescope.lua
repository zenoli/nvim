return {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    tag = "0.1.0",
    config = function()
        local map = require "user.utils".map
        local actions = require("telescope.actions")
        require("telescope").setup{
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close
                    },
                },
                prompt_prefix = " ",
                selection_caret = "❯ ",
                path_display = { "truncate" },
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                }
            }
        }

        -- Mappings
        map("n", "<leader>f", ":Telescope find_files<cr>")
        map("n", "<leader>a", ":Telescope live_grep<cr>")
        map("n", "<leader>sh", ":Telescope help_tags<cr>")
        map("n", "<leader>sb", ":Telescope buffers<cr>")
        map("n", "<leader>sc", ":Telescope command_history<cr>")
        map("n", "<leader>sm", ":Telescope man_pages<cr>")
        map("n", "<leader>sk", ":Telescope keymaps<cr>")
        map("n", "<leader>sp", ":Telescope builtin<cr>")
        map("n", "gr", ":Telescope lsp_references<cr>")
        map("n", "gd", ":Telescope lsp_definitions<cr>")
    end
}
