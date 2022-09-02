return {
    "christoomey/vim-tmux-navigator",
    config = function()
        local map = require "user.utils".map
        map("n", "<m-h>", ":TmuxNavigateLeft<cr>")
        map("n", "<m-j>", ":TmuxNavigateDown<cr>")
        map("n", "<m-k>", ":TmuxNavigateUp<cr>")
        map("n", "<m-l>", ":TmuxNavigateRigh<cr>")
    end
}
