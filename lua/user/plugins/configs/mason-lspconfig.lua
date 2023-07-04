return {
    "williamboman/mason-lspconfig.nvim",
    requires = require "user.plugins.configs.mason",
    after = "mason.nvim",
    config = function()
        local servers = require "user.plugins.configs.lsp.servers"
        require "mason-lspconfig".setup({ ensure_installed = servers })
    end
}
