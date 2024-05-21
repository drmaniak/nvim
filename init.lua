vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Set Custom Keymaps --
local map = vim.keymap.set
map('i', 'kj', '<ESC>', {noremap = true, silent = false})
map('i', 'jk', '<ESC>', {noremap = true, silent = false})

-- Configure Lazy --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Create tables for plugins and opts --
local opts = {}



-- Load Lazy with Plugins --
require("lazy").setup("plugins")

-- Other Plugin Setup --
-- Catppuccin --
require("catppuccin").setup {
  transparent_background = false,
  color_overrides = {
    mocha = {
      base = "#14122a"
    }
  }

}
vim.cmd.colorscheme "catppuccin-mocha"

-- Telescope --
local builtin  = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})

map("n", "<C-n>", ":Neotree toggle filesystem left<CR>")














