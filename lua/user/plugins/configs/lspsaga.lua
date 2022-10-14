return {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local map = require "user.utils".map
        local saga = require"lspsaga"

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

        -- Rename
        map("n", "<leader>rn", "<cmd>Lspsaga rename<cr>")

        -- Code action
        map("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>")
        -- map("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<cr>")
        map("v", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
        map("n", "gp", "<cmd>Lspsaga preview_definition<cr>")
        -- Outline
        map("n","<leader>o", "<cmd>LSoutlineToggle<cr>")

        -- Hover Doc
        map("n", "K", "<cmd>Lspsaga hover_doc<cr>")
        map("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<cr>")
        map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<cr>")

        map("n", "gR", "<cmd>Lspsaga lsp_finder<cr>")

    end,
}
