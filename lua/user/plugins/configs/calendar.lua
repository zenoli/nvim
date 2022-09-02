return {
    "mattn/calendar-vim",
    ft = "calendar",
    cmd = { "Calendar", "CalendarH", "CalendarT", "CalendarVR", "CalendarSearch" },
    config = function()
        vim.api.nvim_set_var("calendar_monday", 1)
        vim.api.nvim_set_var("calendar_no_mappings", 1)
    end
}
