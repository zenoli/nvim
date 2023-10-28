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
            globals = {},
        },
        format = {
            enable = false,
        },
        -- workspace = {
        --     -- Make the server aware of Neovim runtime files
        --     library = vim.api.nvim_get_runtime_file("", true),
        -- },
    },
}

return M
