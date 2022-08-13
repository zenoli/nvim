local plenary = require "plenary.reload"
local packer = require "packer"

local M = {}
function M.reload()
    plenary.reload_module "plug-configs"
    plenary.reload_module "user"
    dofile(vim.env.MYVIMRC)
    packer.compile()
    vim.notify("Reloading Neovim config...", vim.log.levels.INFO, { render = "minimal" })
    vim.cmd("nohlsearch")
end

function M.map(mode, lhs, rhs)
    local opts = { silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end

return M
