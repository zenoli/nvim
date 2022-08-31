return {
    "godlygeek/tabular",
    config = function()
        local map = require "user.utils".map
        map("v", "<leader>tt", ":Tabularize /")
    end
}
