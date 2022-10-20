return {
    "hrsh7th/nvim-cmp",
    requires = {
        "hrsh7th/cmp-nvim-lsp",
        { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
        { "hrsh7th/cmp-path", after = "nvim-cmp" },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
        { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
        -- { "rafamadriz/friendly-snippets", opt = true },
        -- { "onsails/lspkind.nvim", opt = true }
    },
    wants = { "LuaSnip", "friendly-snippets", "lspkind.nvim" },
    event = "InsertEnter",
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        local cmp = require "cmp"
        local luasnip = require "luasnip"

        luasnip.setup {
            history = true,
            enable_autosnippets = true,
        }

        cmp.setup {
            snippet = {
                expand = function(args) luasnip.lsp_expand(args.body) end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert {
                ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                ["<c-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
                ["<c-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
                ["<c-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
                ["<cr>"] = cmp.mapping(cmp.mapping.confirm { select = false }, { "i", "c" }),
                ["/"] = cmp.mapping(cmp.mapping.confirm { select = true }, { "i", "c" }),
            },
            sources = {
                { name = "nvim_lua", group_index = 0 },
                { name = "nvim_lsp", group_index = 1 },
                { name = "luasnip", group_index = 1 },
                { name = "path", group_index = 1 },
                { name = "buffer", group_index = 2 },
            },
            formatting = {
                fields = { "abbr", "kind", "menu", },
                format = require("lspkind").cmp_format {
                    mode = "symbol_text",
                    preset = "default",
                    maxwidth = 50,
                    before = function(entry, vim_item)
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[LUA]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
            },
        }

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline("/", {
            view = { entries = "custom" },
            mapping = cmp.mapping.preset.cmdline(),
            completion = { autocomplete = false },
            sources = {
                { name = "buffer" },
            },
        })
        cmp.setup.cmdline(":", {
            view = { entries = "custom" },
            mapping = cmp.mapping.preset.cmdline(),
            completion = { autocomplete = false },
            sources = cmp.config.sources {
                { name = "path" },
                { name = "cmdline" },
            },
        })

        local map = require("user.utils").map
        map({ "i", "n", "s" }, "<c-l>", function() luasnip.expand_or_jump() end)
        map({ "i", "n", "s" }, "<c-h>", function() luasnip.jump(-1) end)
    end,
}
