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
    end
}
