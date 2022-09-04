local map = require("user.utils").map
local utils = require "user.plugins.configs.dap.utils"

map("n", "<leader>b", function() require("dap").toggle_breakpoint() end)
map("n", "<leader>B", function() utils.set_conditional_breakpoint() end)
map("n", "<leader>L", function() utils.set_logpoint() end)
map("n", "<leader>dd", function() utils.continue() end)
map("n", "<leader>dq", function() utils.close() end)
-- map("n", "<leader>dd", require("dap").continue)
-- map("n", "<leader>dq", require("dap").terminate)
map("n", "<leader>dc", function() require("dap").run_to_cursor() end)
map("n", "<leader>dr", function() require("dap").repl.toggle() end)
map("n", "[s", function() require("dap").up() end)
map("n", "]s", function() require("dap").down() end)
-- map("n", "<cr>", function() require("dap")_keybind(require("dap").run_to_cursor, "<cr>") end)
map("n", "J", function() require("dap") utils.dap_keybind(require("dap").step_over, "J") end)
map("n", "L", function() require("dap") utils.dap_keybind(require("dap").step_into, "^") end)
map("n", "H", function() require("dap") utils.dap_keybind(require("dap").step_out, "$") end)
map("n", "dB", function() require("dap").step_back() end)

map({ "n", "v" }, "<leader>E", function() require("dapui").eval() end)
