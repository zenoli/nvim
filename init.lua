require "settings"
require "keybindings"
require "plugins"

vim.keymap.set("n", "<leader>vs", function()
    require("plenary.reload").reload_module("plug-configs")
  end, { desc = "Reloading vim config" })


