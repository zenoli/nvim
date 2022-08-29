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
    use "morhetz/gruvbox"
    use "ghifarit53/tokyonight-vim"
    use "NLKNguyen/papercolor-theme"
    use { "vimwiki/vimwiki", cmd = { "VimwikiDiaryIndex", "VimwikiMakeDiaryNote" } }
    use "junegunn/gv.vim"

    use "kana/vim-surround"
    use "tpope/vim-repeat"
    use "tpope/vim-commentary"
    use "szw/vim-maximizer"
    -- use "antoinemadec/FixCursorHold.nvim"
    use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }


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

