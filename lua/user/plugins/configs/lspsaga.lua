return {
    "glepnir/lspsaga.nvim",
    branch = "main",
    -- module = "lspsaga",
    setup = function()
        local map = function(mode, lhs, rhs, opts)
            require("user.utils").map(mode, lhs, rhs, opts, "lspsaga")
        end

        -- Rename
        map("n", "<leader>rn", "Lspsaga rename")

        -- Code action
        map("n", "gp", "Lspsaga peek_definition")
        -- Outline
        map("n", "<leader>o", "Lspsaga outline")

        -- Hover Doc
        map("n", "K", "Lspsaga hover_doc")
        map("n", "<leader>cd", "Lspsaga show_cursor_diagnostics")
        map("n", "<leader>ld", "Lspsaga show_line_diagnostics")

        map("n", "gR", "Lspsaga lsp_finder")
    end,
    config = function()
        -- local map = require "user.utils".map
        local saga = require "lspsaga"

        saga.setup {
            border_style = "rounded",
            code_action_lightbulb = {
                enable = true,
                enable_in_insert = true,
                cache_code_action = true,
                sign = false,
                update_time = 150,
                sign_priority = 20,
                virtual_text = true,
            },
            symbol_in_winbar = {
                enable = false,
            },
            code_action_keys = {
                quit = "",
                exec = "",
            },
            finder_action_keys = {
                open = "o",
                vsplit = "<c-v>",
                split = "<c-x>",
                tabe = "t",
                quit = "",
                scroll_down = "<c-d>",
                scroll_up = "<c-u>", -- quit can be a table
            },
        }
    end,
}
