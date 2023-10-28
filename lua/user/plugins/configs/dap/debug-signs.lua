return {
    setup = function()
        local dap_signs = {
            breakpoint = {
                text = " ",
                texthl = "DiagnosticError",
                linehl = "",
                numhl = "",
            },
            breakpoint_condition = {
                text = " ",
                texthl = "DiagnosticError",
                linehl = "",
                numhl = "",
            },
            log_point = {
                text = " ",
                texthl = "DiagnosticInfo",
                linehl = "",
                numhl = "",
            },
            breakpoint_rejected = {
                text = " ",
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
    end
}
