return {
    "williamboman/mason-lspconfig.nvim",
    requires = { "williamboman/mason.nvim" },
    config = function()
        local servers = require "user.plugins.configs.lsp.servers"

        require "user.plugins.configs.mason".config()
        require "mason-lspconfig".setup({ ensure_installed = servers })
    end
}
