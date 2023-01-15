return {
    "mickael-menu/zk-nvim",
    config = function()
        require("zk").setup {
            -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
            -- it's recommended to use "telescope" or "fzf"

            picker = "select",

            lsp = {
                -- `config` is passed to `vim.lsp.start_client(config)`
                config = {
                    cmd = { "zk", "lsp" },
                    name = "zk",
                    -- on_attach = ...
                    -- etc, see `:h vim.lsp.start_client()`
                },

                -- automatically attach buffers in a zk notebook that match the given filetypes
                auto_attach = {
                    enabled = true,
                    filetypes = { "markdown" },
                },
            },
        }

        local map = require("user.utils").map
        local function create_new_note()
            vim.ui.input({
                prompt = "Title: ",
                relative = "editor",
            }, function(input) require("zk").new { title = input } end)
        end

        -- Create a new note after asking for its title.
        map("n", "<leader>zn", create_new_note)
        map("v", "<leader>zn", ":ZkNewFromTitleSelection<cr>")

        -- Open notes.
        map("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>")
        -- Open notes associated with the selected tags.
        map("n", "<leader>zt", "<Cmd>ZkTags<CR>")

        -- Search for the notes matching a given query.
        map(
            "n",
            "<leader>zf",
            "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>"
        )
        -- Search for the notes matching the current visual selection.
        map("v", "<leader>zf", ":'<,'>ZkMatch<CR>")
    end,
}
