local packer = require "user.plugins.packer-config"
local function plug(name)
    return require ("user.plugins.configs." .. name)
end

-- Install your plugins here
packer.startup(function(use)
    use "lewis6991/impatient.nvim"
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim" -- Useful lua functions used lots of plugins

    -- Themes
    use { "morhetz/gruvbox", cmd = "colorscheme gruvbox"}
    use { "ghifarit53/tokyonight-vim", cmd = "colorscheme tokyonight" }
    use { "NLKNguyen/papercolor-theme", cmd = "colorscheme PaperColor" }

    use { "vimwiki/vimwiki", cmd = { "VimwikiDiaryIndex", "VimwikiMakeDiaryNote" } }
    use { "junegunn/gv.vim", cmd = "GV", wants = "vim-fugitive" }
    use "kana/vim-surround"
    use "tpope/vim-repeat"
    use "tpope/vim-commentary"
    use { "szw/vim-maximizer", keys = "<f3>" }
    use { "j-hui/fidget.nvim", config = function () require "fidget".setup() end }
    use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }
    use {
        "L3MON4D3/LuaSnip",
        config = function ()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
        opt = true
    }
    use { "rafamadriz/friendly-snippets", opt = true }
    use { "onsails/lspkind.nvim", opt = true }
    use {
        "kelly-lin/telescope-ag",
        after = "telescope.nvim",
        config = function () require "telescope".load_extension "ag" end
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        after = "telescope.nvim",
        config = function () require "telescope".load_extension "fzf" end
    }


    use (plug "lspsaga")
    -- use (plug "nvim-tree")
    use (plug "neo-tree")
    use (plug "mason")
    use (plug "mason-lspconfig")
    use (plug "lsp")
    use (plug "nvim-notify")
    use (plug "calendar")
    use (plug "telescope")
    -- use (plug "easymotion")
    use (plug "fugitive")
    use (plug "onedark")
    use (plug "gitsigns")
    use (plug "indentline")
    use (plug "lualine")
    use (plug "rnvimr")
    use (plug "tabularize")
    use (plug "treesitter")
    use (plug "vim-tmux-navigator")
    use (plug "vimux")
    use (plug "nvim-cmp")
    use (plug "neodim")
    use (plug "vim-svelte")
    use (plug "autopairs")
    use (plug "nvim-window-picker")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require "packer".sync()
    end
end)

