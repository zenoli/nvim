return {
    "theHamsta/nvim-dap-virtual-text",
    after = "nvim-dap",
    config = function()
        require("nvim-dap-virtual-text").setup {
            all_frames = false
        }
    end
}
