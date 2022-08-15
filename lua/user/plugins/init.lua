local packer = require "user.plugins.packer-config"

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

    use (require "user.plugins.nvim-tree")
    use (require "user.plugins.mason")
    use (require "user.plugins.mason-lspconfig")
    use (require "user.plugins.lsp")
    use (require "user.plugins.nvim-notify")
    use (require "user.plugins.calendar")
    -- use (require "user.plugins.coc")
    use (require "user.plugins.easymotion")
    use (require "user.plugins.fugitive")
    use (require "user.plugins.fzf")
    use (require "user.plugins.gitgutter")
    use (require "user.plugins.indentline")
    use (require "user.plugins.lualine")
    use (require "user.plugins.rnvimr")
    use (require "user.plugins.tabularize")
    use (require "user.plugins.treesitter")
    use (require "user.plugins.vim-tmux-navigator")
    use (require "user.plugins.vimux")
    use (require "user.plugins.nvim-cmp")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require "packer".sync()
    end
end)

