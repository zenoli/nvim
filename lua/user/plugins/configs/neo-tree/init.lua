return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        {
            -- only needed if you want to use the commands with "_with_window_picker" suffix
            's1n7ax/nvim-window-picker',
            tag = "v1.*",
            config = function()
                require'window-picker'.setup({
                    autoselect_one = true,
                    include_current = false,
                    filter_rules = {
                        -- filter using buffer options
                        bo = {
                            -- if the file type is one of following, the window will be ignored
                            filetype = { 'neo-tree', "neo-tree-popup", "notify", "quickfix", "help", "fugitive" },

                            -- if the buffer type is one of following, the window will be ignored
                            buftype = { 'terminal' },
                        },
                    },
                    other_win_hl_color = '#e35e4f',
                })
            end,
        }
    },
    config = function ()
        -- Unless you are still migrating, remove the deprecated commands from v1.x
        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

        -- If you want icons for diagnostic errors, you'll need to define them somewhere:
        vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
        vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
        vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
        vim.fn.sign_define("DiagnosticSignHint",
        {text = "", texthl = "DiagnosticSignHint"})

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
                    ["<c-c>"] = "clear_filter",
                },
            },
            event_handlers = event_handlers
        }

        local map = require "user.utils".map
        map("n", "<leader>e", ":Neotree toggle<cr>")
        vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
    end
}
