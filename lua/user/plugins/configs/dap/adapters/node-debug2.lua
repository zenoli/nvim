local M = {}
local dap_utils = require "user.plugins.configs.dap.utils"
local NODE_DEBUG2_ADAPTER_BIN = dap_utils.MASON_BIN_PATH .. "/node-debug2-adapter"

function M.setup()
    local dap = require "dap"
    dap.adapters.node2 = {
        type = "executable",
        command = NODE_DEBUG2_ADAPTER_BIN,
    }
    dap.configurations.javascript = {
        {
            name = "Launch Node2 debugger",
            type = "node2",
            request = "launch",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal",
            skipFiles = {
                "<node_internals>/**/*.js",
                "${workspaceFolder}/node_modules/**/*.js",
                "${workspaceFolder}/lib/**/*.js",
            },
        },
        -- {
        --     -- For this to work you need to make sure the node process is started
        --     -- with the `--inspect` flag.
        --     name = "Attach Node2 debugger to process",
        --     type = "node2",
        --     request = "attach",
        --     processId = require("dap.utils").pick_process,
        -- },
    }
end

return M
