local M = {}

M.typescript_plugin = function()
    return { "jose-elias-alvarez/typescript.nvim" }
end

M.setup = function(opts)
    require("typescript").setup {
        disable_commands = false,
        server = opts
    }
end

return M
