local M = {}

function M.plugin()
    return {
        "mfussenegger/nvim-dap-python",
        after = "nvim-dap",
        config = function()
            local DEBUGPY_PATH = require("user.plugins.configs.mason.utils").MASON_PACKAGE_PATH
                .. "/debugpy/venv/bin/python3"
            local dap_python = require "dap-python"
            dap_python.setup(DEBUGPY_PATH)
        end,
    }
end

return M
