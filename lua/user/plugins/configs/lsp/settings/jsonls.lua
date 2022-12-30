local M = {}

function M.schemastore_plugin() return { "b0o/schemastore.nvim" } end

M.settings = {
    json = {
        schemas = vim.list_extend(
            {
                {
                    description = "Railway.app JSON schema",
                    fileMatch =  { "railway.json", ".railway.json" },
                    name = "railway.json",
                    url = "https://railway.app/railway.schema.json" ,
                },
            },
            require("schemastore").json.schemas()
        ),
        validate = { enable = true },
    },
}

return M
