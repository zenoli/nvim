return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local null_ls = require "null-ls"
        require("null-ls").setup {
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,

                -- Javascript
                null_ls.builtins.diagnostics.eslint,

                -- Shell/Bash
                null_ls.builtins.code_actions.shellcheck,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.hover.printenv,
            },
        }
    end,
}
