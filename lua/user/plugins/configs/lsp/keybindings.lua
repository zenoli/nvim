return {
    setup = function(client, bufnr)
        -- Mapings.
        local map = require("user.utils").map
        local opts = { buffer = bufnr }
        map("n", "gi", vim.lsp.buf.implementation, opts)
        map("n", "<leader>F", vim.lsp.buf.format, opts)
        map("n", "<space>gd", vim.lsp.buf.type_definition, opts)
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
