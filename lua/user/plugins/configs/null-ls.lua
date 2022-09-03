return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function ()
        require("null-ls").setup {
            sources = {
                require("null-ls").builtins.diagnostics.luacheck,
                require("null-ls").builtins.diagnostics.eslint,
                require("null-ls").builtins.completion.spell,
            },
        }
    end

}
