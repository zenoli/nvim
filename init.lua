require "user.settings"
require "user.keybindings"
require "user.plugins"
require "user.theme"


vim.keymap.set("n", "<leader>vs", function()
    local plenary = require("plenary.reload")
    plenary.reload_module("plug-configs")
    plenary.reload_module("user")

    dofile(vim.env.MYVIMRC)
    require("packer").compile()
end, { desc = "Reloading vim config" })


