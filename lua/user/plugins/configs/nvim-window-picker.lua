return {
    -- only needed if you want to use the commands with "_with_window_picker" suffix
    "s1n7ax/nvim-window-picker",
    tag = "v1.*",
    opt = true,
    config = function()
        require 'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
            hint = 'statusline-winbar',
            filter_rules = {
                -- Ignore picker for ft/bt:
                bo = {
                    filetype = {
                        "neo-tree",
                        "neo-tree-popup",
                        "notify",
                        "quickfix",
                        "help",
                        "fugitive"
                    },
                    buftype = { "terminal" },
                },
            },
            highlights = {
                statusline = {
                    unfocused = {
                        fg = '#ededed',
                        bg = '#4493c8',
                        bold = true,
                    },
                },
            },
        })
    end,
}
