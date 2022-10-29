local M = {}

M.plugin = function()
    return {
        "jbyuki/one-small-step-for-vimkind",
        after = "nvim-dap",
        module = "osv",
        key = "<f5>",
        setup = function()
            vim.api.nvim_set_keymap('n', '<F5>', [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })
        end
    }
end

function M.setup()
    local dap = require "dap"
    dap.configurations.lua = {
        {
            type = "nlua",
            request = "attach",
            name = "Attach to running Neovim instance",
        },
    }

    dap.adapters.nlua = function(callback, config)
        callback {
            type = "server",
            host = config.host or "127.0.0.1",
            port = config.port or 8086,
        }
    end
end

return M
