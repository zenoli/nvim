local M = {}
local neotree_ui = require "neo-tree.ui.renderer"
local neotree_fs = require "neo-tree.sources.filesystem"
local neotree_cmd = require "neo-tree.sources.filesystem.commands"

function M.navigate_out(state)
    local node = state.tree:get_node()
    local is_cwd = function (n)
        return n.path == vim.fn.getcwd()
    end
    if node.type == "directory" and not is_cwd(node) and node:is_expanded() then
        neotree_fs.toggle_directory(state, node)
    else
        neotree_ui.focus_node(state, node:get_parent_id())
    end
end

function M.navigate_in(state)
    local node = state.tree:get_node()
    if node.type == "directory" then
        if not node:is_expanded() then
            neotree_fs.toggle_directory(state, node)
        elseif node:has_children() then
            neotree_ui.focus_node(state, node:get_child_ids()[1])
        end
    else
        neotree_cmd.open_with_window_picker(state)
    end
end

return M
