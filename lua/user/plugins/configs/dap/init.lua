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
            require("user.plugins.configs.dap.debug-signs").setup()
            require("user.plugins.configs.dap.adapters.node-debug2").setup()
        end,
    },
}
