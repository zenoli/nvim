-- local plenary = require "plenary.reload"
-- local packer = require "packer"

local M = {}

local function exec_if_exists(module_name, cb)
    local status_ok, module = pcall(require, module_name)
    if status_ok then
        cb(module)
    else
        vim.notify("Failed to load module " .. module_name)
    end
end

function M.reload()
    exec_if_exists(
        "plenary.reload",
        function (m)
            m.reload_module "user"
        end
    )
    -- -- plenary.reload_module "user.plugins"
    -- -- plenary.reload_module "user"
    dofile(vim.env.MYVIMRC)

    exec_if_exists(
        "packer",
        function (m)
            m.install()
            m.compile()
        end
    )
    -- packer.install() -- If new plugins detected, install, do nothing otherwise.
    -- packer.compile() -- Recompile `packer_compiled.lua`
    vim.notify("Reloading Neovim config...", vim.log.levels.INFO, { render = "minimal" })
    vim.cmd("nohlsearch")
end

function M.map(mode, lhs, rhs, opts)
    opts = opts or {}
    local default_opts = { silent = true }
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", default_opts, opts))
end

-- Transforms a string s, given in `kebap-case` and transforms it 
-- to `snake_case`.
function M.to_snake_case(s)
    return string.gsub(s, "-", "_")
end

-- Transforms a string s, given in `snake_case` and transforms it 
-- to `kebap-case`.
function M.to_kebap_case(s)
    return string.gsub(s, "_", "-")
end

return M
