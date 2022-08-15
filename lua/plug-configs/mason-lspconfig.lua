return {
    "williamboman/mason-lspconfig.nvim",
    requires = { "williamboman/mason.nvim" },
    config = function()
        local servers = require "plug-configs.lsp.servers"

        require "plug-configs.mason".config()
        require "mason-lspconfig".setup({ ensure_installed = servers })
    end
}
