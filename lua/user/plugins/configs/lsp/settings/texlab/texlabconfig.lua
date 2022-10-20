local config = {
    cache_root = vim.fn.stdpath "cache",
    reverse_search_edit_cmd = vim.cmd.edit,
}

return {
    "f3fora/nvim-texlabconfig",
    config = function() require("texlabconfig").setup(config) end,
    -- ft = { 'tex', 'bib' }, -- for lazy loading
    run = "go build",
}
