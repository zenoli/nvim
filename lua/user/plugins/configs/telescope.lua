return {
    "nvim-telescope/telescope.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    },
    tag = "0.1.0",
    config = function()
        local map = require "user.utils".map
        local actions = require("telescope.actions")
        local telescope = require "telescope"
        telescope.setup{
            defaults = {
                -- mappings = {
                --     i = {
                --         ["<esc>"] = actions.close
                --     },
                -- },
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
            },
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                }
            }
        }
        telescope.load_extension("fzf")

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
