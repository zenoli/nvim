return {
    "williamboman/mason-lspconfig.nvim",
    requires = { "williamboman/mason.nvim" },
    config = function()
        local servers = require "user.plugins.lsp.servers"

        require "user.plugins.mason".config()
        require "mason-lspconfig".setup({ ensure_installed = servers })
    end
}
