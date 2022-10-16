local M = {}

M.MASON_BIN_PATH = vim.fn.stdpath "data" .. "/mason/bin"
M.MASON_PACKAGE_PATH = vim.fn.stdpath "data" .. "/mason/packages"

return M
