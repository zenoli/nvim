local M = {}

M.MASON_BIN_PATH = vim.fn.stdpath "data" .. "/mason/bin"
M.MASON_PACKAGE_PATH = vim.fn.stdpath "data" .. "/mason/packages"

function M.continue()
    local dap = require "dap"
    local dapui = require "dapui"
    if not dap.session() then dapui.open() end
    dap.continue()
end

function M.close()
    local dap = require "dap"
    local dapui = require "dapui"
    if dap.session() then
        dap.terminate()
    else
        dapui.close()
    end
    -- dap.close()
end

function M.dap_keybind(dap_action, key)
    local dap = require "dap"
    if dap.session() then
        dap[dap_action]()
    else
        vim.cmd([[execute "normal! ]] .. key .. [["]])
    end
end

function M.set_conditional_breakpoint()
    vim.ui.input(
        { prompt = "Breakpoint condition: " },
        function(input)
            require("dap").set_breakpoint(input)
        end
    )
end

function M.set_logpoint()
    vim.ui.input(
        { prompt = "Log point message: " },
        function(input)
            require("dap").set_breakpoint(nil, nil, input)
        end
    )
end

return M
