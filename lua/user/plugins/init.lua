local packer = require "user.plugins.packer-config"
local function plug(name)
    return require ("user.plugins.configs." .. name)
end

-- Install your plugins here
packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim" -- Useful lua functions used lots of plugins

    -- Themes
    use "morhetz/gruvbox"
    use "ghifarit53/tokyonight-vim"
    use "NLKNguyen/papercolor-theme"
    use "vimwiki/vimwiki"
    use "junegunn/gv.vim"

    use "kana/vim-surround"
    use "tpope/vim-repeat"
    use "tpope/vim-commentary"
    use "szw/vim-maximizer"
    -- use "antoinemadec/FixCursorHold.nvim"
    use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }


    use (plug "nvim-tree")
    use (plug "mason")
    use (plug "mason-lspconfig")
    use (plug "lsp")
    use (plug "nvim-notify")
    use (plug "calendar")
    use (plug "telescope")
    -- use (plug "coc")
    use (plug "easymotion")
    use (plug "fugitive")
    -- use (plug "fzf")
    -- use (plug "gitgutter")
    use (plug "onedark")
    use (plug "gitsigns")
    use (plug "indentline")
    use (plug "lualine")
    use (plug "rnvimr")
    use (plug "tabularize")
    use (plug "treesitter")
    use (plug "vim-tmux-navigator")
    use (plug "vimux")
    use (plug("nvim-cmp"))
    use (plug "neodim")
    -- use { "leafOfTree/vim-svelte-plugin", config = function () end }
    use (plug "vim-svelte")
    use (plug "autopairs")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require "packer".sync()
    end
end)

