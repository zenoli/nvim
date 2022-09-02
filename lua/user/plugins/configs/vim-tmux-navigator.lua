return {
    "christoomey/vim-tmux-navigator",
    config = function()
        vim.api.nvim_set_var("tmux_navigator_disable_when_zoomed", 1)
        vim.api.nvim_set_var("tmux_navigator_no_mappings", 1)

        local map = require "user.utils".map
        map("n", "<a-h>", ":TmuxNavigateLeft<cr>")
        map("n", "<a-j>", ":TmuxNavigateDown<cr>")
        map("n", "<a-k>", ":TmuxNavigateUp<cr>")
        map("n", "<a-l>", ":TmuxNavigateRigh<cr>")
    end
}
