return {
    "vimwiki/vimwiki",
    cmd = { "VimwikiDiaryIndex", "VimwikiMakeDiaryNote" },
    setup = function()
        vim.g.vimwiki_dir_link = "index"
    end
}
