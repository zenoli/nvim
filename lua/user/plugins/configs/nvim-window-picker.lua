return {
    -- only needed if you want to use the commands with "_with_window_picker" suffix
    "s1n7ax/nvim-window-picker",
    tag = "v1.*",
    config = function()
        require'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
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
            -- other_win_hl_color = '#e35e4f', -- orange
            other_win_hl_color = '#4493c8', -- blue
        })
    end,
}
