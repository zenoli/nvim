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

    use { "junegunn/gv.vim", cmd = "GV", wants = "vim-fugitive" }
    use { "tpope/vim-rhubarb", cmd = "Gbrowse", after = "vim-fugitive" }
    use { "szw/vim-maximizer", keys = "<f3>" }
    use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }
    use { "rafamadriz/friendly-snippets", opt = true }
    use { "onsails/lspkind.nvim", opt = true }
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    }

    use(plug "aerial")
    use(plug "toggle-lsp-diagnostics")
    use(plug "zk")
    use(plug "colorizer")
    use(plug "exrc")
    use(plug "vimwiki")
    use(plug "catpuccin")
    use(plug "dressing")
    use(plug "neo-tree")
    use(plug "luasnip")
    use(plug "refactoring")
    use(plug "fidget")
    use(plug "winbar")
    use(plug "mason")
    use(plug "mason-lspconfig")
    use(plug "lsp")
    use(plug "dap")
    use(plug "neo-test")
    use(plug "null-ls")
    use(plug "nvim-notify")
    use(plug "calendar")
    use(plug "telescope")
    use(plug "fugitive")
    use(plug "diffview")
    use(plug "onedark")
    use(plug "gitsigns")
    use(plug "indentline")
    use(plug "lualine")
    use(plug "tabularize")
    use(plug "treesitter")
    use(plug "vim-tmux-navigator")
    use(plug "vimux")
    use(plug "nvim-cmp")
    use(plug "neodim")
    use(plug "vim-svelte")
    use(plug "autopairs")
    use(plug "nvim-window-picker")
    use(plug "vimtex")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
