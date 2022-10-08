local M = {}

M.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
end

M.settings = {
    Lua = {
        runtime = {
            version = "LuaJIT",
        },
        diagnostics = {
            enable = true,
            globals = { "vim", "awesome", "tag", "client", "screen" }
        },
        format = {
            enable = false,
        },
    },
}

return M
