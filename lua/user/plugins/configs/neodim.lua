-- return {
--     "zbirenbaum/neodim",
--     event = "LspAttach",
--     config = function()
--         require("neodim").setup({
--             alpha = 0.75,
--             blend_color = "#000000",
--             update_in_insert = {
--                 enable = true,
--                 delay = 100,
--             },
--             hide = {
--                 virtual_text = true,
--                 signs = true,
--                 underline = true,
--             }
--         })
--     end
-- }
return {
    "zbirenbaum/neodim",
    event = "LspAttach",
    branch = "v2",
    config = function()
        require("neodim").setup({
            refresh_delay = 75, -- time in ms to wait after typing before refresh diagnostics
            alpha = .75,
            blend_color = "#000000",
            hide = { underline = true, virtual_text = true, signs = true },
            priority = 100, -- priority of dim highlights (increasing may interfere with semantic tokens!!)
            disable = {}, -- table of filetypes to disable neodim
        })
    end,
}
