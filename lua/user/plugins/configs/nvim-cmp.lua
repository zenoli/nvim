return {
    "hrsh7th/nvim-cmp",
    requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets"
    },
    config = function()
        local kind_icons = {
            Text = "",
            Method = "m",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
        }

        require("luasnip.loaders.from_vscode").lazy_load()
        local cmp = require "cmp"
        cmp.setup {
            snippet = {
                expand = function(args)
                    require "luasnip".lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                ["<c-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
                ["<c-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
                ["<c-ep"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
                ["<cr>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
            }),
            sources = {
                { name = "nvim_lua", group_index = 0 },
                { name = "nvim_lsp", group_index = 1 },
                { name = "luasnip", group_index = 1 },
                { name = "path", group_index = 1 },
                { name = "buffer", group_index = 2 },
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
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
        }

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline("/", {
            view = { entries = "custom" },
            mapping = cmp.mapping.preset.cmdline(),
            completion = { autocomplete = false },
            sources = {
                { name = "buffer" }
            }
        })
        cmp.setup.cmdline(':', {
            view = { entries = "custom" },
            mapping = cmp.mapping.preset.cmdline(),
            completion = { autocomplete = false },
            sources = cmp.config.sources({
                { name = "path" },
                { name = "cmdline" }
            }),
        })
    end
}
