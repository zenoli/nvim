local plenary = require "plenary.reload"
local packer = require "packer"

local M = {}
function M.reload()
    plenary.reload_module "plug-configs"
    plenary.reload_module "user"
    dofile(vim.env.MYVIMRC)
    packer.install() -- If new plugins detected, install, do nothing otherwise.
    packer.compile() -- Recompile `packer_compiled.lua`
    vim.notify("Reloading Neovim config...", vim.log.levels.INFO, { render = "minimal" })
    vim.cmd("nohlsearch")
end

function M.map(mode, lhs, rhs, opts)
    opts = opts or {}
    local default_opts = { silent = true }
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", default_opts, opts))
end

return M
