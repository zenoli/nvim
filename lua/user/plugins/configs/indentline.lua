return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
        require("indent_blankline").setup {
            show_current_context = true,
            show_current_context_start = false,
            filetype_exclude = { "vimwiki", "text", "help" }
        }

        -- Mappings
        local map = require "user.utils".map
        map("n", "<leader>ti", ":IndentBlanklineToggle<cr>")
    end
}
