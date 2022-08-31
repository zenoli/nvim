return {
    "kevinhwang91/rnvimr",
    keys = "<leader>ra",
    config = function()
        vim.cmd[[let g:rnvimr_ex_enable = 1]]
        local map = require "user.utils".map
        map("n", "<leader>ra", ":RnvimrToggle<cr>")
    end,
    run = "make sync"
}
