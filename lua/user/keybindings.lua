local utils = require "user.utils"
local map = utils.map

-- Leaders
vim.g.mapleader = [[ ]] -- Use space as leader
vim.g.maplocalleader = [[\]] -- Use backslash as localleader

map("n", "<leader>vs", utils.reload)

map("", "<space>", "<nop>") -- disable space because leader
map("n", "q:", "<nop>")

map("n", "<leader>q", ":q<cr>")
map("n", "<leader>Q", ":qa<cr>")
map("n", "<leader>s", ":% s/")
map("n", "<esc><esc>", ":nohlsearch<cr><esc>")

-- Swap ' and `
map("n", "'", "`")
map("n", "`", "'")

-- Buffer navigation
map("n", "]b", ":bn<cr>")
map("n", "[b", ":bp<cr>")
map("n", "<leader>D", ":bp<bar>bd #<cr>")

-- Scrolling
map("n", "<c-j>", "5<c-e>")
map("n" , "<c-k>", "5<c-y>")

-- Tab navigation
map("n", "]t", ":tabnext<cr>")
map("n", "[t", ":tabprevious<cr>")

-- Quickfixlist navigation
map("n", "]q", ":cnext<cr>")
map("n", "[q", ":cprevious<cr>")
map("n", "<leader>cc", ":cclose<cr>")

-- Convenient pasting
map("n", "<leader>pp", '"0p')
map("n", "<leader>PP", '"0P')
map("n", "<leader>pc", '$"+p')
map("n", "<leader>PC", '$"+P')

map("v", "<leader>y", '"+y')

-- Don't move on *
map("n", "*", ":let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>")

-- Jump to beginning and end of lines easier.
map("n", "H", "^")
map("n", "L", "$")

-- Create newlines without entering insert mode
map("n", "go", "o<esc>")
map("n", "gO", "O<esc>")

-- Undo break points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")

-- Move selected lines vertically
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- map("i", "<c-s-k>", "<esc>:m .-2<cr>==a")
-- map("i", "<c-s-j>", "<esc>:m .+1<CR>==a")

-- Move selected lines horizontally
map("v", ">", ">gv")
map("v", "<", "<gv")

