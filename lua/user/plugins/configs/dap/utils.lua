local M = {}

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
    if require("dap").session() then
        dap_action()
    else
        vim.cmd("normal! " .. key)
    end
end

function M.set_conditional_breakpoint()
    require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end

function M.set_logpoint()
    require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end

return M
