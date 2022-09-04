local M = {}
M.fzf_native = {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "fzf" end,
}

M.ag = {
    "kelly-lin/telescope-ag",
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "ag" end,
}

return M
