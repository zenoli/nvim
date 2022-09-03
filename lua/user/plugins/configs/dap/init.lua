return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require "dap"
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

        function dap_keybind(dap_action, key)
            if require("dap").session() then
                dap_action()
            else
                vim.cmd("normal! " .. key)
            end
        end

        local map = require("user.utils").map
        map("n", "<leader>db", dap.toggle_breakpoint)
        map("n", "<leader>dd", dap.continue)
        map("n", "<leader>dc", dap.run_to_cursor)
        map("n", "<leader>dq", dap.close)
        map("n", "<cr>", function () dap_keybind(dap.run_to_cursor, "<cr>") end)
        map("n", "J", function () dap_keybind(dap.step_over, "J") end)
        map("n", "L", function () dap_keybind(dap.step_into, "^") end)
        map("n", "H", function () dap_keybind(dap.step_out, "$") end)
        -- map("n", "<leader>dj", dap.step_over)
        -- map("n", "<leader>dl", dap.step_into)
        -- map("n", "<leader>dh", dap.step_out)
    end,
}
