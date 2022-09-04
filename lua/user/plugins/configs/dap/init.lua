return {
    "mfussenegger/nvim-dap",
    requires = {
        require "user.plugins.configs.dap-ui",
        require "user.plugins.configs.dap-virtual-text",
    },
    config = function()
        local dap = require "dap"
        local dapui = require "dapui"
        dap.adapters.node2 = {
            type = "executable",
            command = "node",
            args = {
                vim.fn.stdpath "data" .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
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
            --     -- For this to work you need to make sure the node process is started with the `--inspect` flag.
            --     name = "Attach to process",
            --     type = "node2",
            --     request = "attach",
            --     processId = require("dap.utils").pick_process,
            -- },
        }
        dap_signs = {
            active = false,
            on_config_done = nil,
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

        function continue()
            if not dap.session() then dapui.open() end
            dap.continue()
        end

        function close()
            if dap.session() then
                dap.terminate()
            else
                dapui.close()
            end
        end

        function dap_keybind(dap_action, key)
            if require("dap").session() then
                dap_action()
            else
                vim.cmd("normal! " .. key)
            end
        end

        function set_conditional_breakpoint()
            dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
        end

        function set_logpoint() dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ") end

        -- dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            vim.notify "Terminated"
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            vim.notify "Exited"
            dapui.close()
        end

        local map = require("user.utils").map
        map("n", "<leader>b", dap.toggle_breakpoint)
        map("n", "<leader>B", set_conditional_breakpoint)
        map("n", "<leader>L", set_logpoint)
        map("n", "<leader>dd", continue)
        map("n", "<leader>dq", close)
        -- map("n", "<leader>dd", dap.continue)
        -- map("n", "<leader>dq", dap.terminate)
        map("n", "<leader>dc", dap.run_to_cursor)
        map("n", "<leader>dr", dap.repl.toggle)
        map("n", "[s", dap.up)
        map("n", "]s", dap.down)
        map("n", "<cr>", function() dap_keybind(dap.run_to_cursor, "<cr>") end)
        map("n", "J", function() dap_keybind(dap.step_over, "J") end)
        map("n", "L", function() dap_keybind(dap.step_into, "^") end)
        map("n", "H", function() dap_keybind(dap.step_out, "$") end)
        map("n", "dB", dap.step_back)

        map({ "n", "v" }, "<leader>E", dapui.eval)
    end,
}
