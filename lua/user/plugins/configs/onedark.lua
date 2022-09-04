return {
    "navarasu/onedark.nvim",
    config = function ()
        local onedark = require "onedark"
        onedark.setup {
            style = "cool",
            transparent = false
        }
        -- onedark.load()
        vim.cmd [[colorscheme onedark]]

        -- Less obtrusive highlight color
        vim.api.nvim_set_hl(0, "Search", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IncSearch", { link = "Visual" })

        -- More red in onedark
        vim.api.nvim_set_hl(0, "TSVariable", { link = "TSParameter" })

        -- More subtle indent lines
        vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { link = "LineNr" })
        vim.api.nvim_set_hl(0, "IndentBlanklineChar", { link = "VertSplit" })

        -- Clean neo-tree separation border
        vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { link = "NeoTreeEndOfBuffer" })

        -- Make unstage icon non-italic
        vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { link = "NeoTreeGitDeleted" })
    end
}
