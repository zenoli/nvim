return {
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
    cmd = { "ToggleDiag", "ToggleDiagDefault" },
    key = "<leader>C",
    config = function() require("toggle_lsp_diagnostics").init() end,
}
