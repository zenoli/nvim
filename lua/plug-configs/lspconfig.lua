return {
    "neovim/nvim-lspconfig",
    config = function()
        local map = require "user.functions".map
        local lua_opts = require "plug-configs.lsp.configs.sumneko-lua"
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

        lua_opts = vim.tbl_deep_extend("force", opts, lua_opts)
        require('lspconfig')['pyright'].setup {
            on_attach = on_attach,
            flags = lsp_flags,
        }
        require('lspconfig')['sumneko_lua'].setup(lua_opts)
    end
}
