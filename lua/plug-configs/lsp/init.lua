return {
    "neovim/nvim-lspconfig",
    requires = { "williamboman/mason-lspconfig.nvim"},
    config = function()
        local utils = require "user.utils"
        local map = utils.map
        local lspconfig = require "lspconfig"

        local servers = {
            "sumneko_lua",
            "pyright"
        }

        require("mason-lspconfig").setup({ ensure_installed = servers })

        -- Mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        -- map("n", "<space>e", vim.diagnostic.open_float)
        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)

        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        local on_attach = function(client, bufnr)
            -- Mappings.
            local opts = { buffer = bufnr }
            map("n", "gD", vim.lsp.buf.declaration, opts)
            map("n", "gd", vim.lsp.buf.definition, opts)
            map("n", "K", vim.lsp.buf.hover, opts)
            map("n", "gi", vim.lsp.buf.implementation, opts)
            map("n", "<space>D", vim.lsp.buf.type_definition, opts)
            map("n", "<space>rn", vim.lsp.buf.rename, opts)
            map("n", "<space>ca", vim.lsp.buf.code_action, opts)
            map("n", "gr", vim.lsp.buf.references, opts)
        end

        local lsp_flags = {
            -- This is the default in Nvim 0.7+
            debounce_text_changes = 150,
        }

        local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        local capabilities =  vim.lsp.protocol.make_client_capabilities()
        if status_ok then
            capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
        else
            vim.notify("cmp_nvim_lsp is not installed...", vim.log.levels.WARN)
        end

        local opts = {
            lsp_flags = lsp_flags,
            on_attach = on_attach,
            capabilities = capabilities
        }

        for _, server in pairs(servers) do
            local has_custom_opts, server_custom_opts = pcall(
                require,
                "plug-configs.lsp.configs." .. utils.to_kebap_case(server)
            )
            if has_custom_opts then
                opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
            end
            lspconfig[server].setup(opts)
        end
    end
}
