return {
    "tpope/vim-fugitive",
    key = {
        "<leader>gg",
        "<leader>gc",
        "<leader>gb",
        "<leader>gp",
        "<leader>gt",
        "<leader>g<leader>",
    },
    cmd = { "Git","GBrowse" },
    setup = function()
        local map = require("user.utils").map
        map("n", "<leader>gg", ":Git<cr>")
        map("n", "<leader>gp", ":Git push<cr>")
        map("n", "<leader>gt", ":Git log --graph --oneline --all<cr>")
        map("n", "<leader>gc", ":Git checkout<space>", { silent = false })
        map("n", "<leader>gb", ":Git branch<space>", { silent = false })
        map("n", "<leader>g<leader>", ":Git ", { silent = false })
    end,
}
