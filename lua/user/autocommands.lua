local utils = require "user.utils"

local custom_autocommands = vim.api.nvim_create_augroup(
    "custom_autocommands",
    { clear = true }
)

vim.api.nvim_create_autocmd("BufWritePost", {
    group = custom_autocommands,
    pattern = vim.env.XDG_CONFIG_HOME .. "/nvim/**/*.lua",
    callback = utils.reload
})

vim.api.nvim_create_autocmd("VimResized", {
    group = custom_autocommands,
    pattern = "*",
    command = [[execute "normal! \<C-w>="]]
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = custom_autocommands,
    pattern = "*.tmux",
    callback = function() vim.opt.filetype = "tmux" end
})
