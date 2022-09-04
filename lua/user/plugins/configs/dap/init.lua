local dapui = require "user.plugins.configs.dap-ui"
local dap_virtualtext = require "user.plugins.configs.dap-virtual-text"
return {
    dapui,
    {
        "mfussenegger/nvim-dap",
        requires = dap_virtualtext,
        module = "dap",
        setup = function() require "user.plugins.configs.dap.keybindings" end,
        config = function()
            local dap = require "dap"
            -- local dapui = require "dapui"
            dap.adapters.node2 = {
                type = "executable",
                command = "node",
                args = {
                    vim.fn.stdpath "data"
                        .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
                },
            }
            dap.configurations.javascript = {
                {
                    name = "Launch",
                    type = "node2",
                    request = "launch",
                    program = "${file}",
                    cwd = vim.fn.getcwd(),
                    sourceMaps = true,
                    protocol = "inspector",
                    console = "integratedTerminal",
                },
                -- {
                --     -- For this to work you need to make sure the node process is started 
                --     -- with the `--inspect` flag.
                --     name = "Attach to process",
                --     type = "node2",
                --     request = "attach",
                --     processId = require("dap.utils").pick_process,
                -- },
            }
            dap_signs = {
                breakpoint = {
                    text = "",
                    texthl = "DiagnosticError",
                    linehl = "",
                    numhl = "",
                },
                breakpoint_condition = {
                    text = "",
                    texthl = "DiagnosticError",
                    linehl = "",
                    numhl = "",
                },
                log_point = {
                    text = "ﯽ",
                    texthl = "DiagnosticInfo",
                    linehl = "",
                    numhl = "",
                },
                breakpoint_rejected = {
                    text = "",
                    texthl = "DiagnosticWarn",
                    linehl = "",
                    numhl = "",
                },
                stopped = {
                    text = "",
                    texthl = "",
                    linehl = "StatusLine",
                    numhl = "",
                },
            }

            vim.fn.sign_define("DapBreakpoint", dap_signs.breakpoint)
            vim.fn.sign_define("DapBreakpointCondition", dap_signs.breakpoint_condition)
            vim.fn.sign_define("DapLogPoint", dap_signs.log_point)
            vim.fn.sign_define("DapBreakpointRejected", dap_signs.breakpoint_rejected)
            vim.fn.sign_define("DapStopped", dap_signs.stopped)
        end,
    },
}
