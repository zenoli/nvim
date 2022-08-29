return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        -- NOTE: The fuzzy search only works reliably when 'fd' is installed.
    },
    after = "nvim-window-picker",
    config = function ()
        -- Unless you are still migrating, remove the deprecated commands from v1.x
        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

        local navigation = require "user.plugins.configs.neo-tree.navigation"
        local event_handlers = require "user.plugins.configs.neo-tree.event_handlers"

        require "neo-tree".setup {
            close_if_last_window = true,
            enable_git_status = true,
            enable_diagnostics = false,
            popup_border_style = "rounded",
            default_component_configs = {
                indent = {
                    with_expanders = true,
                },

                container = {
                    enable_character_fade = true
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    default = "",
                },
                modified = {
                    symbol = "",
                    highlight = "NeoTreeModified",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "", -- or "✚"
                        modified  = "", -- or ""
                        deleted   = "✖",-- this can only be used in the git_status source
                        renamed   = "",-- this can only be used in the git_status source
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "",
                        staged    = "",
                        conflict  = "",
                    },
                },
            },
            window = {
                position = "left",
                width = 30,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
                mappings = {
                    ["o"] = "open_with_window_picker",
                    ["h"] = navigation.navigate_out,
                    ["l"] = navigation.navigate_in,
                    ["<c-v>"] = "open_vsplit",
                    ["<c-x>"] = "open_split",
                },
            },
            filesystem = {
                follow_current_file = true
            },
            event_handlers = event_handlers
        }

        local map = require "user.utils".map
        map("n", "<leader>e", ":Neotree toggle<cr>")
        vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
    end
}
