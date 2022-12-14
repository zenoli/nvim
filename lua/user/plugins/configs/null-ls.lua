return {
    "jose-elias-alvarez/null-ls.nvim",
    wants = {
        "refactoring.nvim",
        "typescript.nvim"
    },
    config = function()
        local null_ls = require "null-ls"
        require("null-ls").setup {
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,

                -- Javascript
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.code_actions.eslint_d,
                null_ls.builtins.formatting.prettierd,
                require("typescript.extensions.null-ls.code-actions"),
                -- null_ls.builtins.formatting.prettier_eslint,

                -- Shell/Bash
                null_ls.builtins.code_actions.shellcheck,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.hover.printenv,

                -- Git
                null_ls.builtins.code_actions.gitsigns,

                -- Latex
                null_ls.builtins.code_actions.proselint,
                null_ls.builtins.diagnostics.proselint,

                -- Misc
                null_ls.builtins.code_actions.refactoring
            },
        }
    end,
}
