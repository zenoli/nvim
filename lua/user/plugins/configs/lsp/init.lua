return {
    "neovim/nvim-lspconfig",
    wants = {
        "mason-lspconfig.nvim",
        "telescope.nvim",
        "schemastore.nvim",
    },
    requires = {
        require("user.plugins.configs.lsp.settings.jsonls").schemastore_plugin(),
        require("user.plugins.configs.lsp.settings.tsserver").typescript_plugin(),
        require("user.plugins.configs.lsp.settings.texlab").texlabconfig_plugin(),
    },
    config = function()
        local lspconfig = require "lspconfig"
        local utils = require "user.utils"
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
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        if status_ok then
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
        else
            vim.notify("cmp_nvim_lsp is not installed...", vim.log.levels.WARN)
        end

        local function get_server_config(server)
            local opts = {
                lsp_flags = lsp_flags,
                capabilities = capabilities,
            }

            local has_custom_config, custom_config =
                pcall(require, "user.plugins.configs.lsp.settings." .. utils.to_kebap_case(server))
            if has_custom_config then
                -- Add server specific settings
                if custom_config.settings then
                    if type(custom_config.settings) == "function" then
                        opts.settings = custom_config.settings()
                    else
                        opts.settings = custom_config.settings
                    end
                end
                -- Add server specific callback
                if custom_config.on_attach then
                    opts.on_attach = function(client, bufnr)
                        on_attach(client, bufnr)
                        custom_config.on_attach(client, bufnr)
                    end
                else
                    opts.on_attach = on_attach
                end
            else
                opts.on_attach = on_attach
            end
            return opts
        end

        for _, server in pairs(servers) do
            local opts = get_server_config(server)
            if server == "jdtls" then
                utils.noop(opts)
            elseif server == "tsserver" then
                require("user.plugins.configs.lsp.settings.tsserver").setup(opts)
            else
                lspconfig[server].setup(opts)
            end
        end

        -- Keybindings
        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)
    end,
}
