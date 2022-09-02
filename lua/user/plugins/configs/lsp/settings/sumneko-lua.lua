local M = {}

M.on_attach = function (client, bufnr)
    local ns = vim.lsp.diagnostic.get_namespace(client.id)
    vim.diagnostic.disable(bufnr, ns)
end


M.settings = {
    Lua = {
        runtime = {
            version = "LuaJIT",
        },
        diagnostics = {
            globals = {},
        },
    },
}

return M
