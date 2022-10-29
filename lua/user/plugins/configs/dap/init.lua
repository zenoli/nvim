local dapui = require "user.plugins.configs.dap-ui"
local dap_virtualtext = require "user.plugins.configs.dap-virtual-text"
local osv = require "user.plugins.configs.dap.adapters.osv"

return {
    dapui,
    dap_virtualtext,
    osv.plugin(),
    {
        "mfussenegger/nvim-dap",
        module = "dap",
        setup = require("user.plugins.configs.dap.keybindings").setup,
        config = function()
            local dap = require "dap"
            require("dap.ext.vscode")
            require("user.plugins.configs.dap.debug-signs").setup()
            require("user.plugins.configs.dap.adapters.node-debug2").setup()
            require("user.plugins.configs.dap.adapters.bash-debug").setup()
            require "user.plugins.configs.dap.adapters.osv".setup()
        end,
    },
}
