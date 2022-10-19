return {
    "lervag/vimtex",
    -- Note: This enables lazy-loading but disables zathura inverse-search.
    -- ft = { "tex", "latex", "plaintex", "bib" },
    config = function()
        vim.cmd [[
        let g:xwindow_id = system("xdotool getactivewindow")
        let g:vimtex_view_method = "zathura"

        augroup vimtex_forward_search
            au!
            " Refocus editor 50ms after forward search is performed
            au User VimtexEventView silent execute "!sleep 0.05 && xdotool windowactivate --sync " . g:xwindow_id
            " Forward search on compile
            au User VimtexEventCompileSuccess VimtexView
            au BufWinEnter *.{tex,bib} VimtexView
        augroup END
        ]]
    end,
}
