return {
    "stevearc/dressing.nvim",
    after = "nvim-dap",
    event = "UIEnter",
    config = function()
        require("dressing").setup {
            select = {
                enabled = true,
                winblend = 70,
                border = "rounded",
            },
            input = {
                -- Set to false to disable the vim.ui.input implementation
                enabled = true,

                -- Default prompt string
                default_prompt = "Input:",

                -- Can be 'left', 'right', or 'center'
                prompt_align = "center",

                -- When true, <Esc> will close the modal
                insert_only = false,

                -- When true, input will start in insert mode.
                start_in_insert = true,

                -- These are passed to nvim_open_win
                anchor = "SW",
                border = "rounded",
                win_options = {
                    winhighlight = "NormalFloat:NormalNC"
                }
            },
            nui = {
                position = "50%",
                size = nil,
                relative = "editor",
                border = {
                    style = "rounded",
                },
            },
            builtin = {
                windblend = 10,
                border = "rounded",
                winhighlight = "NormalFloat:NormalNC"
            },
        }
    end,
}
