return {
    "navarasu/onedark.nvim",
    config = function ()
        local onedark = require "onedark"
        onedark.setup {
            style = "cool",
            transparent = false
        }
        onedark.load()
        vim.cmd [[colorscheme onedark]]
        vim.api.nvim_set_hl(0, "Search", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IncSearch", { link = "Visual" })
        vim.api.nvim_set_hl(0, "TSVariable", { link = "TSParameter" })
        vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { link = "LineNr" })
        vim.api.nvim_set_hl(0, "IndentBlanklineChar", { link = "VertSplit" })
        vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { link = "NeoTreeEndOfBuffer" })
    end
}
