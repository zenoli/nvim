return {
    "neovim/nvim-lspconfig",
    wants = {
        "mason-lspconfig.nvim",
        "telescope.nvim",
    },
    config = function()
        local lspconfig = require "lspconfig"
        local utils = require "user.utils"
        -- local servers = require "user.plugins.configs.lsp.servers"
        local servers = require("mason-lspconfig").get_installed_servers()
        local map = utils.map

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

        vim.lsp.handlers["textDocument/hover"] =
            vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

        vim.lsp.handlers["textDocument/signatureHelp"] =
            vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

        local on_attach = require("user.plugins.configs.lsp.keybindings").setup
        local lsp_flags = {
            -- This is the default in Nvim 0.7+
            debounce_text_changes = 150,
        }

        local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        if status_ok then
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
        else
            vim.notify("cmp_nvim_lsp is not installed...", vim.log.levels.WARN)
        end

        for _, server in pairs(servers) do
            if server ~= "jdtls" then
                local opts = {
                    lsp_flags = lsp_flags,
                    capabilities = capabilities,
                }

                local has_custom_config, custom_config = pcall(
                    require,
                    "user.plugins.configs.lsp.settings." .. utils.to_kebap_case(server)
                )
                if has_custom_config then
                    -- Add server specific settings
                    if custom_config.settings then opts.settings = custom_config.settings end
                    -- Add server specific callback
                    if custom_config.on_attach then
                        opts.on_attach = function(client, bufnr)
                            on_attach(client, bufnr)
                            custom_config.on_attach(client, bufnr)
                        end
                    end
                else
                    opts.on_attach = on_attach
                end
                lspconfig[server].setup(opts)
            end
        end

        -- Keybindings
        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)
    end,
}
