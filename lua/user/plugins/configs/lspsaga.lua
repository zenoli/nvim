return {
    "glepnir/lspsaga.nvim",
    branch = "main",
    module = "lspsaga",
    setup = function()
        local map = function(mode, lhs, rhs, opts)
            local function rhs_cb()
                require "lspsaga"
                vim.cmd(rhs)
            end
            require("user.utils").map(mode, lhs, rhs_cb, opts)
        end

        -- Rename
        map("n", "<leader>rn", "Lspsaga rename")

        -- Code action
        map("n", "<leader>ca", "Lspsaga code_action")
        map("v", "<leader>ca", "lua vim.lsp.buf.code_action()")
        map("n", "gp", "Lspsaga preview_definition")
        -- Outline
        map("n","<leader>o", "LSoutlineToggle")

        -- Hover Doc
        map("n", "K", "Lspsaga hover_doc")
        map("n", "<leader>cd", "Lspsaga show_cursor_diagnostics")
        map("n", "<leader>ld", "Lspsaga show_line_diagnostics")

        map("n", "gR", "Lspsaga lsp_finder")

    end,
    config = function()
        -- local map = require "user.utils".map
        local saga = require "lspsaga"

        saga.init_lsp_saga {
            border_style = "rounded",
            -- code_action_icon = "",
            code_action_lightbulb = {
                sign = false,
                virtual_text = true
            },
            code_action_keys = {
                quit = "<esc>",
                exec = "<cr>",
            },
            finder_action_keys = {
                open = "o",
                vsplit = "<c-v>",
                split = "<c-x>",
                tabe = "t",
                quit = "<esc>",
                scroll_down = "<c-d>",
                scroll_up = "<c-u>", -- quit can be a table
            },
        }
    end,
}
