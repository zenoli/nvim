local M = {}

function M.plugin()
    return {
        "mxsdev/nvim-dap-vscode-js",
        after = "nvim-dap",
        config = function()
            local mason_utils = require("user.plugins.configs.mason.utils")
            local JS_DEBUG_ADAPTER_PATH = mason_utils.MASON_PACKAGE_PATH .. "/js-debug-adapter"
            local dap = require "dap"
            require("dap-vscode-js").setup {
                debugger_path = JS_DEBUG_ADAPTER_PATH,
                adapters = {
                    "pwa-node",
                    "pwa-chrome",
                    "pwa-msedge",
                    "node-terminal",
                    "pwa-extensionHost",
                },
            }

            print "Setting up vscode-js-debug-adapter 2"
            for _, language in ipairs { "typescript", "javascript" } do
                dap.configurations[language] = {
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Launch file",
                        program = "${file}",
                        cwd = "${workspaceFolder}",
                    },
                }
            end
        end,
    }
end

return M
