local packer = require "user.plugins.packer-config"
local function plug(name) return require("user.plugins.configs." .. name) end

-- Instal your plugins here
packer.startup(function(use)
    use "lewis6991/impatient.nvim"
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim" -- Useful lua functions used lots of plugins
    use "mfussenegger/nvim-jdtls"

    -- Themes
    use "morhetz/gruvbox"
    use "ghifarit53/tokyonight-vim"
    use "folke/tokyonight.nvim"
    use "NLKNguyen/papercolor-theme"
    use "edkolev/tmuxline.vim"
    use { "katawful/kat.nvim", tag = "1.0" }

    use "kana/vim-surround"
    use "tpope/vim-repeat"
    use "tpope/vim-commentary"

    use { "vimwiki/vimwiki", cmd = { "VimwikiDiaryIndex", "VimwikiMakeDiaryNote" } }
    use { "junegunn/gv.vim", cmd = "GV" }
    use { "tpope/vim-rhubarb", cmd = "Gbrowse", after = "vim-fugitive" }
    use { "szw/vim-maximizer", keys = "<f3>" }
    use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }
    use { "rafamadriz/friendly-snippets", opt = true }
    use { "onsails/lspkind.nvim", opt = true }
    use {
        "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
        cmd = { "ToggleDiag", "ToggleDiagDefault" },
        key = "<leader>C",
    }

    use(plug "dressing")
    use(plug "lspsaga")
    use(plug "neo-tree")
    -- use(plug "nvim-tree")
    use(plug "luasnip")
    use(plug "refactoring")
    -- use(plug "lf")
    -- use(plug "toggleterm")
    use(plug "fidget")
    use(plug "winbar")
    use(plug "mason")
    use(plug "mason-lspconfig")
    use(plug "lsp")
    use(plug "dap")
    use(plug "null-ls")
    use(plug "nvim-notify")
    use(plug "calendar")
    use(plug "telescope")
    use(plug "fugitive")
    use(plug "onedark")
    use(plug "gitsigns")
    use(plug "indentline")
    use(plug "lualine")
    use(plug "rnvimr")
    use(plug "tabularize")
    use(plug "treesitter")
    use(plug "vim-tmux-navigator")
    use(plug "vimux")
    use(plug "nvim-cmp")
    use(plug "neodim")
    use(plug "vim-svelte")
    use(plug "autopairs")
    use(plug "vimtex")
    use(plug "nvim-window-picker")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
