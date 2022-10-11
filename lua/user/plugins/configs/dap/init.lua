local dapui = require "user.plugins.configs.dap-ui"
local dap_virtualtext = require "user.plugins.configs.dap-virtual-text"
return {
    dapui,
    dap_virtualtext,
    {
        "mfussenegger/nvim-dap",
        -- requires = dap_virtualtext,
        module = "dap",
        setup = require("user.plugins.configs.dap.keybindings").setup,
        config = function()
            local dap = require "dap"
            require("dap.ext.vscode")
            require("user.plugins.configs.dap.debug-signs").setup()
            require("user.plugins.configs.dap.adapters.node-debug2").setup()
            require("user.plugins.configs.dap.adapters.bash-debug").setup()
        end,
    },
}
