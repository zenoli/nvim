local packer = require "user.packer-config"

-- Install your plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim" -- Useful lua functions used lots of plugins

    -- Themes
    use "navarasu/onedark.nvim"
    use "morhetz/gruvbox"
    use "ghifarit53/tokyonight-vim"
    use "NLKNguyen/papercolor-theme"
    use "vimwiki/vimwiki"
    use "junegunn/gv.vim"

    use "kana/vim-surround"
    use "tpope/vim-repeat"
    use "tpope/vim-commentary"
    use "szw/vim-maximizer"

    use (require "plug-configs.nvim-tree")
    use (require "plug-configs.mason")
    use (require "plug-configs.mason-lspconfig")
    use (require "plug-configs.lsp")
    use (require "plug-configs.nvim-notify")
    use (require "plug-configs.calendar")
    -- use (require "plug-configs.coc")
    use (require "plug-configs.easymotion")
    use (require "plug-configs.fugitive")
    use (require "plug-configs.fzf")
    use (require "plug-configs.gitgutter")
    use (require "plug-configs.indentline")
    use (require "plug-configs.lualine")
    use (require "plug-configs.rnvimr")
    use (require "plug-configs.tabularize")
    use (require "plug-configs.treesitter")
    use (require "plug-configs.vim-tmux-navigator")
    use (require "plug-configs.vimux")
    use (require "plug-configs.nvim-cmp")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require "packer".sync()
    end
end)

