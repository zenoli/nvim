local M = {}

M.texlabconfig_plugin = function()
    local config = {
        cache_root = vim.fn.stdpath "cache",
        reverse_search_edit_cmd = vim.cmd.edit,
    }

    return {
        "f3fora/nvim-texlabconfig",
        config = function() require("texlabconfig").setup(config) end,
        run = "go build",
    }
end

M.on_attach = function(client, bufnr)
    local map = require("user.utils").map
    local opts = { buffer = bufnr }
    map("n", "<localleader>f", ":TexlabForward<cr>", opts)
    map("n", "<localleader>b", ":TexlabBuild<cr>", opts)
end

function M.settings()
    return {
        texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
            build = {
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                executable = "latexmk",
                forwardSearchAfter = false,
                onSave = true,
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = false,
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
                executable = "zathura",
                -- args = {"--synctex-forward", "%l:1:%f", "%p"},
                args = {
                    "--synctex-editor-command",
                    require("texlabconfig").project_dir()
                        .. [[/nvim-texlabconfig -file '%{input}' -line %{line}]],
                    "--synctex-forward",
                    "%l:1:%f",
                    "%p",
                },
                onSave = true,
            },
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = true,
                ["local"] = ".latexindent.yaml",
            },
        },
    }
end

return M
