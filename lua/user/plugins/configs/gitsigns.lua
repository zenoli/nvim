return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require "gitsigns".setup {
            on_attach = function(bufnr)
                local map = require "user.utils".map
                local gs = package.loaded.gitsigns
                local opts = { buffer = bufnr }

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then return "]c" end
                    vim.schedule(function() gs.next_hunk() end)
                    return "<Ignore>"
                end, { expr = true})

                map("n", "[c", function()
                    if vim.wo.diff then return "[c" end
                    vim.schedule(function() gs.prev_hunk() end)
                    return "<Ignore>"
                end, { expr = true })

                -- Actions
                map({"n", "v"}, "<leader>hs", ":Gitsigns stage_hunk<cr>", opts)
                map({"n", "v"}, "<leader>hr", ":Gitsigns reset_hunk<cr>", opts)
                map("n", "<leader>hS", gs.stage_buffer, opts)
                map("n", "<leader>hR", gs.reset_buffer, opts)
                map("n", "<leader>hu", gs.undo_stage_hunk, opts)
                map("n", "<leader>hp", gs.preview_hunk, opts)
                map("n", "<leader>hb", function() gs.blame_line { full = true } end, opts)
                map("n", "<leader>tb", gs.toggle_current_line_blame, opts)
                map("n", "<leader>hd", gs.diffthis, opts)
                map("n", "<leader>hD", function() gs.diffthis("~") end, opts)
                map("n", "<leader>td", gs.toggle_deleted, opts)

                -- Text object
                map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<cr>")
            end
        }
    end
}
