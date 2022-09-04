return {
    setup = function()
        local map = require("user.utils").map

        -- Finder bindings
        map("n", "<leader>f", function() require("telescope.builtin").find_files() end)
        map(
            "n",
            "<leader>sfh",
            function() require("telescope.builtin").find_files { hidden = true } end
        )
        map(
            "n",
            "<leader>sfi",
            function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end
        )
        map("n", "<leader>a", function() require("telescope.builtin").live_grep() end)
        map("n", "<leader>sb", function() require("telescope.builtin").buffers() end)
        map("n", "<leader>sh", function() require("telescope.builtin").help_tags() end)
        map("n", "<leader>sH", function() require("telescope.builtin").highlights() end)
        map("n", "<leader>sc", function() require("telescope.builtin").command_history() end)
        map("n", "<leader>sm", function() require("telescope.builtin").man_pages() end)
        map("n", "<leader>sk", function() require("telescope.builtin").keymaps() end)
        map("n", "<leader>st", function() require("telescope.builtin").builtin() end)
    end,
}
