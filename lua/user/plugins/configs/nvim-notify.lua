return {
    "rcarriga/nvim-notify",
    event = "VimEnter",
    config = function()
        local nvim_notify = require("notify")
        nvim_notify.setup {
            render = "default",
            stages = "fade",
            timeout = 1000,
            -- background_colour = "#000000",
        }
        vim.notify = nvim_notify
    end
}
