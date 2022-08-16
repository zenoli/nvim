return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("indent_blankline").setup {
            show_current_context = true,
            show_current_context_start = false,
        }

        -- Mappings
        local map = require "user.utils".map
        map("n", "<leader>ti", ":IndentBlanklineToggle<cr>")

        vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { link = "TSNone"})
    end
}
