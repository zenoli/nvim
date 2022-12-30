local dapui = require "user.plugins.configs.dap-ui"
local dap_virtualtext = require "user.plugins.configs.dap-virtual-text"
local osv = require "user.plugins.configs.dap.adapters.osv"
local vscode_js = require "user.plugins.configs.dap.adapters.vscode-js"
local debugpy = require "user.plugins.configs.dap.adapters.debugpy"

return {
    dapui,
    dap_virtualtext,
    osv.plugin(),
    vscode_js.plugin(),
    debugpy.plugin(),
    {
        "mfussenegger/nvim-dap",
        module = "dap",
        setup = require("user.plugins.configs.dap.keybindings").setup,
        config = function()
            require "dap"
            require("dap.ext.vscode")
            require("user.plugins.configs.dap.debug-signs").setup()
            -- require("user.plugins.configs.dap.adapters.node-debug2").setup()
            require("user.plugins.configs.dap.adapters.bash-debug").setup()
            require "user.plugins.configs.dap.adapters.osv".setup()
        end,
    },
}
