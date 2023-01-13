return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "main",
    requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        -- NOTE: The fuzzy search only works reliably when 'fd' is installed.
    },
    wants = "nvim-window-picker",
    module = "neo-tree",
    setup = function()
        local map = function(mode, lhs, rhs, opts)
            require("user.utils").map(mode, lhs, rhs, opts, "neo-tree")
        end
        map("n", "<leader>e", "Neotree toggle")
        map("n", "<localleader><localleader>", "Neotree reveal")
    end,
    config = function()
        -- Unless you are still migrating, remove the deprecated commands from v1.x
        vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

        local navigation = require "user.plugins.configs.neo-tree.navigation"
        local event_handlers = require "user.plugins.configs.neo-tree.event_handlers"

        local clipboard_icons = {
            cut = "",
            copy = "",
        }

        require("neo-tree").setup {
            close_if_last_window = true,
            enable_git_status = true,
            enable_diagnostics = false,
            log_level = "warn",
            popup_border_style = "rounded",
            default_component_configs = {
                indent = {
                    with_expanders = true,
                },

                container = {
                    enable_character_fade = true,
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    folder_empty_open = "",
                    default = "",
                },
                modified = {
                    symbol = "",
                    highlight = "NeoTreeModified",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added = "", -- or "✚"
                        modified = "", -- or ""
                        deleted = "✖", -- this can only be used in the git_status source
                        renamed = "", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
            window = {
                position = "left",
                width = 30,
                insert_as = "sibling",
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
                    ["q"] = "clear_filter",
                    ["/"] = "noop", -- "noop" removes a default mapping
                    ["g/"] = "fuzzy_finder",
                    ["Z"] = "expand_all_nodes",
                    ["a"] = {
                        "add",
                        config = {
                            show_path = "relative",
                        },
                    },
                    ["A"] = {
                        "add_directory",
                        config = {
                            show_path = "relative",
                        },
                    },
                },
            },
            filesystem = {
                follow_current_file = false,
                group_empty_dirs = true,
                use_libuv_file_watcher = true,
                async_directory_scan = "auto",
                scan_mode = "deep",
                components = {
                    clipboard = function(config, node, state)
                        local highlights = require "neo-tree.ui.highlights"
                        local clipboard = state.clipboard or {}
                        local clipboard_state = clipboard[node:get_id()]
                        if not clipboard_state then return {} end
                        return {
                            text = clipboard_icons[clipboard_state.action]
                                or clipboard_state.action,
                            highlight = config.highlight or highlights.DIM_TEXT,
                        }
                    end,
                },
            },
            event_handlers = event_handlers,
        }
    end,
}
