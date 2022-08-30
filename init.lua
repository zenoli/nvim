local impatient_ok, _ = pcall(require, "impatient")
if not impatient_ok then vim.notify "impatient loading skipped" end

require "user.plugins"
require "user.keybindings"
require "user.options"
require "user.autocommands"
-- require "user.theme"
require "user.abbreviations"

