local M = {}

local function exec_if_exists(module_name, cb, silent)
    local status_ok, module = pcall(require, module_name)
    if status_ok then
        cb(module)
    elseif not silent then
        vim.notify("Failed to load module " .. module_name)
    end
end

M.exec_if_exists = exec_if_exists

function M.reload()
    -- vim.cmd("LuaCacheClear")
    exec_if_exists("plenary.reload", function(m)
        -- m.reload_module "user"
        m.reload_module "user.keybindings"
        m.reload_module "user.plugins"
        m.reload_module "user.option"
        m.reload_module "user.autocommands"
        m.reload_module "user.abbreviations"
        m.reload_module "user.utils"
    end)
    dofile(vim.env.MYVIMRC)

    exec_if_exists("packer", function(m)
        m.install()
        m.compile()
    end)
    vim.notify("Reloading nvim config...", vim.log.levels.INFO, { render = "minimal" })
    vim.cmd "nohlsearch"
end

function M.map(mode, lhs, rhs, opts, dependency)
    opts = opts or {}
    local default_opts = { silent = true }

    local rhs_cb
    if dependency then
        rhs_cb = function()
            require(dependency)
            vim.cmd(rhs)
        end
    else
        rhs_cb = rhs
    end

    vim.keymap.set(mode, lhs, rhs_cb, vim.tbl_extend("force", default_opts, opts))
end

-- Transforms a string s, given in `kebap-case` and transforms it
-- to `snake_case`.
function M.to_snake_case(s) return string.gsub(s, "-", "_") end

-- Transforms a string s, given in `snake_case` and transforms it
-- to `kebap-case`.
function M.to_kebap_case(s) return string.gsub(s, "_", "-") end


function M.contains(tab, val)
    for _, v in ipairs(tab) do
        if v == val then
            return true
        end
    end
    return false
end

function M.table_exclude(tab, exclude)
    local result = {}
    for _, v in ipairs(tab) do
        if not M.contains(exclude, v) then
            table.insert(result, v)
        end
    end
    return result
end

function M.noop(...) return nil end

M.paths = {
    MASON_BIN_PATH = vim.fn.stdpath "data" .. "/mason/bin",
    MASON_PACKAGE_PATH = vim.fn.stdpath "data" .. "/mason/packages",
}

return M
