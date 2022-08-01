require "user.options"
require "user.keybindings"
require "user.autocommands"
require "user.plugins"
require "user.theme"

local user_fn = require "user.functions"

vim.keymap.set(
    "n", "<leader>vs", user_fn.reload,
    { desc = "Reloading vim config" }
)
