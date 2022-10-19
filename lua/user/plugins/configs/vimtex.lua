return {
    "lervag/vimtex",
    ft = { "tex", "latex", "plaintex", "bib" },
    config = function()
        vim.cmd [[
        let g:xwindow_id = system('xdotool getactivewindow')
        let g:vimtex_view_method = 'zathura'

        augroup vimtex_event_1
            au!
            au User VimtexEventView :silent !sleep 0.05 && wmctrl -a Tmux
            au User VimtexEventCompileSuccess VimtexView
            au BufWinEnter *.{tex,bib} VimtexView
        augroup END
        ]]

        -- vim.api.nvim_create_autocmd({ "BufRead", "VimtexEventCompileSuccess" }, {
        --     pattern = "*.tex",
        --     command = [[VimtexView]]
        -- })
    end,
}
