local M = {}

function M.plugin()
    return {
        "mxsdev/nvim-dap-vscode-js",
        after = "nvim-dap",
        config = function()
            local mason_utils = require "user.plugins.configs.mason.utils"
            local JS_DEBUG_ADAPTER_PATH = mason_utils.MASON_PACKAGE_PATH .. "/js-debug-adapter"
            local dap = require "dap"
            require("dap-vscode-js").setup {
                debugger_path = JS_DEBUG_ADAPTER_PATH,
                -- debugger_path = os.getenv "HOME" .. "/.DAP/vscode-js-debug",
                node_path = "node",
                adapters = {
                    "pwa-node",
                    "pwa-chrome",
                    "pwa-msedge",
                    "node-terminal",
                    "pwa-extensionHost",
                },
            }

            local exts = {
                "javascript",
                "typescript",
                "javascriptreact",
                "typescriptreact",
                -- using pwa-chrome
                "vue",
                "svelte",
            }

            for _, language in ipairs(exts) do
                dap.configurations[language] = {
                    {
                        name = "Node: Debug current file",
                        type = "pwa-node",
                        trace = true,
                        request = "launch",
                        program = "${file}",
                        cwd = "${workspaceFolder}",
                    },
                    {
                        name = "Node: Attach",
                        type = "pwa-node",
                        request = "attach",
                        processId = require("dap.utils").pick_process,
                        cwd = "${workspaceFolder}",
                    },
                    {
                        name = "Chrome: Attach",
                        type = "pwa-chrome",
                        request = "attach",
                        trace = true,
                        processId = require("dap.utils").pick_process,
                        url = "http://localhost:5173",
                        port = 9222,
                        sourceMaps = true,
                        webRoot = "${workspaceFolder}",
                        cwd = "${workspaceFolder}",
                        skipFiles = { "<node_internals>/**", "**/node_modules/**" },
                        runtimeExecutable = "/usr/bin/google-chrome --remote-debugging-port=9222",
                        enableContentValidation = false,
                    },
                    {
                        name = "Chrome: Debug Vite App (localhost:5173)",
                        type = "pwa-chrome",
                        request = "launch",
                        url = "http://localhost:5173",
                        sourceMaps = true,
                        webRoot = "${workspaceFolder}",
                        cwd = "${workspaceFolder}",
                        skipFiles = { "<node_internals>/**", "**/node_modules/**" },
                        runtimeExecutable = "/usr/bin/google-chrome",
                        enableContentValidation = false,
                    },
                    {
                        name = "Brave: Debug Vite App (localhost:5173)",
                        type = "pwa-chrome",
                        request = "launch",
                        url = "http://localhost:5173",
                        webRoot = "${workspaceFolder}",
                        runtimeExecutable = "/usr/bin/brave-browser",
                    },
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Debug current Vitest file",
                        trace = true,
                        autoAttachChildProcesses = true,
                        skipFiles = { "<node_internals>/**", "**/node_modules/**" },
                        program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
                        runtimeExecutable = "node",
                        rootPath = "${workspaceFolder}",
                        cwd = "${workspaceFolder}",
                        args = { "run", "${relativeFile}" },
                        smartStep = false,
                        protocol = "inspector",
                        console = "integratedTerminal",
                        internalConsoleOptions = "neverOpen",
                    },
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Launch Test Program (pwa-node with vitest)",
                        cwd = vim.fn.getcwd(),
                        program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
                        args = { "run", "${file}" },
                        autoAttachChildProcesses = true,
                        smartStep = true,
                        skipFiles = { "<node_internals>/**", "node_modules/**" },
                    },
                    {
                        name = "Vitest: Debug Tests",
                        type = "pwa-node",
                        request = "launch",
                        cwd = "${workspaceFolder}",
                        program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
                        args = {
                            "--inspect-brk",
                            "--threads",
                            "false",
                        },
                        autoAttachChildProcesses = true,
                        trace = true,
                        console = "integratedTerminal",
                        skipFiles = { "<node_internals>/**", "node_modules/**" },
                        sourceMaps = true,
                        smartStep = true,
                    },
                    {
                        name = "Jest: Debug Tests",
                        type = "pwa-node",
                        request = "launch",
                        trace = true,
                        runtimeExecutable = "node",
                        runtimeArgs = {
                            "./node_modules/jest/bin/jest.js",
                            "--runInBand",
                        },
                        rootPath = "${workspaceFolder}",
                        cwd = "${workspaceFolder}",
                        console = "integratedTerminal",
                        internalConsoleOptions = "neverOpen",
                    },
                }
            end
        end,
    }
end

return M
