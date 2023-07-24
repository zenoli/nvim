return {
    setup = function(client, bufnr)
        -- Mapings.
        local map = require("user.utils").map
        local opts = { buffer = bufnr }

        map("n", "K", vim.lsp.buf.hover)
        map("n", "gi", vim.lsp.buf.implementation, opts)
        map("n", "<leader>ld", function() vim.diagnostic.open_float { scope = "line" } end, opts)
        map("n", "<leader>cd", function() vim.diagnostic.open_float { scope = "cursor" } end, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map("n", "<leader>F", vim.lsp.buf.format, opts)
        map("n", "<space>gd", vim.lsp.buf.type_definition, opts)
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "<leader>sd", function() require("telescope.builtin").diagnostics() end, opts)
        map("n", "gr", function() require("telescope.builtin").lsp_references() end, opts)
        map("n", "gd", function() require("telescope.builtin").lsp_definitions() end, opts)
        map(
            "n",
            "gD",
            function() require("telescope.builtin").lsp_definitions { jump_type = "vsplit" } end,
            opts
        )
    end,
}
