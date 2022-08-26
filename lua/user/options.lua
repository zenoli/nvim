local options = {
    cursorline = true,

    number = true,
    relativenumber = true,
    timeoutlen = 1000,
    ttimeoutlen = 10,
    hidden = true,
    mouse = "a",
    swapfile = false,
    updatetime = 100,

    splitbelow = true,
    splitright = true,

    showtabline = 2,
    laststatus = 2,

    termguicolors = true,

    -- Indentation
    autoindent = true,
    smartindent = true,
    smarttab = true,

    -- tab settings using hard tabs
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    -- Searching
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,

    -- Scrolling
    scrolloff = 5
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
