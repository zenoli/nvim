return {
    "tpope/vim-fugitive",
    key = "<leader>gg",
    cmd = "Git",
    config = function()
        local map = require "user.utils".map
        map("n", "<leader>gg", ":Git<cr>")
        map("n", "<leader>gc", ":Git checkout<space>")
        map("n", "<leader>gb", ":Git branch<space>")
        map("n", "<leader>gp", ":Git push<cr>")
        map("n", "<leader>gt", ":Git log --graph --oneline --all<cr>")
        map("n", "<leader>g<leader>", ":Git ", { silent = false })
    end
}
