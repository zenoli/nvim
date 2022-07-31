-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/olivier/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/olivier/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/olivier/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/olivier/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/olivier/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["calendar-vim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0004source ~/.config/nvim/plug-configs/calendar.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/calendar-vim",
    url = "https://github.com/mattn/calendar-vim"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\nN\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0/source ~/.config/nvim/plug-configs/coc.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\nN\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0/source ~/.config/nvim/plug-configs/fzf.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  indentline = {
    config = { "\27LJ\2\nU\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0006source ~/.config/nvim/plug-configs/indentline.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/indentline",
    url = "https://github.com/yggdroot/indentline"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/papercolor-theme",
    url = "https://github.com/NLKNguyen/papercolor-theme"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["tokyonight-vim"] = {
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/tokyonight-vim",
    url = "https://github.com/ghifarit53/tokyonight-vim"
  },
  ["vim-easymotion"] = {
    config = { "\27LJ\2\nU\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0006source ~/.config/nvim/plug-configs/easymotion.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\nS\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0004source ~/.config/nvim/plug-configs/fugitive.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    config = { "\27LJ\2\nT\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0005source ~/.config/nvim/plug-configs/gitgutter.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-tmux-navigator"] = {
    config = { "\27LJ\2\n]\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0>source ~/.config/nvim/plug-configs/vim-tmux-navigator.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  vimux = {
    config = { "\27LJ\2\nP\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0001source ~/.config/nvim/plug-configs/vimux.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/home/olivier/.local/share/nvim/site/pack/packer/start/vimux",
    url = "https://github.com/benmills/vimux"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0004source ~/.config/nvim/plug-configs/fugitive.vim\bcmd\bvim\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
try_loadstring("\27LJ\2\nN\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0/source ~/.config/nvim/plug-configs/fzf.vim\bcmd\bvim\0", "config", "fzf.vim")
time([[Config for fzf.vim]], false)
-- Config for: vim-gitgutter
time([[Config for vim-gitgutter]], true)
try_loadstring("\27LJ\2\nT\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0005source ~/.config/nvim/plug-configs/gitgutter.vim\bcmd\bvim\0", "config", "vim-gitgutter")
time([[Config for vim-gitgutter]], false)
-- Config for: vimux
time([[Config for vimux]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0001source ~/.config/nvim/plug-configs/vimux.vim\bcmd\bvim\0", "config", "vimux")
time([[Config for vimux]], false)
-- Config for: calendar-vim
time([[Config for calendar-vim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0004source ~/.config/nvim/plug-configs/calendar.vim\bcmd\bvim\0", "config", "calendar-vim")
time([[Config for calendar-vim]], false)
-- Config for: vim-easymotion
time([[Config for vim-easymotion]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0006source ~/.config/nvim/plug-configs/easymotion.vim\bcmd\bvim\0", "config", "vim-easymotion")
time([[Config for vim-easymotion]], false)
-- Config for: vim-tmux-navigator
time([[Config for vim-tmux-navigator]], true)
try_loadstring("\27LJ\2\n]\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0>source ~/.config/nvim/plug-configs/vim-tmux-navigator.vim\bcmd\bvim\0", "config", "vim-tmux-navigator")
time([[Config for vim-tmux-navigator]], false)
-- Config for: indentline
time([[Config for indentline]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0006source ~/.config/nvim/plug-configs/indentline.vim\bcmd\bvim\0", "config", "indentline")
time([[Config for indentline]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\nN\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0/source ~/.config/nvim/plug-configs/coc.vim\bcmd\bvim\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
