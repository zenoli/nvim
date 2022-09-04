local extensions = require "user.plugins.configs.telescope.extensions"

return {
    extensions.fzf_native,
    extensions.ag,
    {
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        tag = "0.1.0",
        cmd = "Telescope",
        module = "telescope",
        setup = require("user.plugins.configs.telescope.keybindings").setup,
        config = function()
            local map = require("user.utils").map
            local actions = require "telescope.actions"
            local telescope = require "telescope"
            telescope.setup {
                defaults = {
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
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                    },
                },
            }
        end,
    },
}
