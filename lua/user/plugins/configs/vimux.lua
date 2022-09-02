return {
    "benmills/vimux",
    config = function()
        local map = require "user.utils".map

        map("n", "<leader>vp", ":VimuxPromptCommand<cr>")
        map("n", "<leader>vl", ":VimuxRunLastCommand<cr>")
        map("n", "<leader>vi", ":VimuxInspectRunner<cr>")
        map("n", "<leader>vq", ":VimuxCloseRunner<cr>")
        map("n", "<leader>vz", ":VimuxZoomRunner<cr>")
    end
}
