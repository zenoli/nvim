return {
    "neovim/nvim-lspconfig",
    config = function()

        local lspconfig = require "lspconfig"
        local utils = require "user.utils"
        local servers = require "user.plugins.configs.lsp.servers"
        local map = utils.map

        -- Mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        -- map("n", "<space>e", vim.diagnostic.open_float)
        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)

        local signs = {
            { name = "DiagnosticSignError", text = "" },
            { name = "DiagnosticSignWarn", text = "" },
            { name = "DiagnosticSignHint", text = "" },
            { name = "DiagnosticSignInfo", text = "" },
        }

        for _, sign in ipairs(signs) do
            vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
        end

        local config = {
            virtual_text = false,
            -- show signs
            signs = {
                active = signs,
            },
            update_in_insert = true,
            underline = true,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        }

        vim.diagnostic.config(config)

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
        })


        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        local on_attach = function(client, bufnr)
            -- Mappings.
            local opts = { buffer = bufnr }
            map("n", "gD", vim.lsp.buf.declaration, opts)
            -- map("n", "gd", vim.lsp.buf.definition, opts)
            map("n", "K", vim.lsp.buf.hover, opts)
            map("n", "gi", vim.lsp.buf.implementation, opts)
            map("n", "<space>D", vim.lsp.buf.type_definition, opts)
            map("n", "<space>rn", vim.lsp.buf.rename, opts)
            map("n", "<space>ca", vim.lsp.buf.code_action, opts)
            -- map("n", "gr", vim.lsp.buf.references, opts)
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
                "user.plugins.configs.lsp.settings." .. utils.to_kebap_case(server)
            )
            if has_custom_opts then
                opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
            end
            lspconfig[server].setup(opts)
        end
    end
}
