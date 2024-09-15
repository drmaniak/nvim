---------------------------------------
-- Leader is mapped in /core/lazy.lua --
----------------------------------------

------------------------
-- Set Custom Keymaps --
------------------------

local map = require("helpers.keys").map -- map signature (mode:str, lhs:str, rhs:str, desc:str, opts:table)

-- Vim commands --
map("i", "kj", "<ESC>", "", { noremap = true })
map("i", "jk", "<ESC>", "", { noremap = true })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear highlights after searching")

---------------------
-- Plugin controls --
---------------------

-- Navigate vim panes better (TMUX) --
map("n", "<C-h>", ":wincmd h<CR>", "Move window left")
map("n", "<C-j>", ":wincmd j<CR>", "Move window down")
map("n", "<C-k>", ":wincmd k<CR>", "Move window up")
map("n", "<C-l>", ":wincmd l<CR>", "Move window right")

-- Telescope --
local telescope_builtin = require("telescope.builtin")
map("n", "<leader>T", ":Telescope<CR>", "Open Telescope Main")
map("n", "<leader>ff", telescope_builtin.find_files, "Telescope - Find File")
map("n", "<leader>fg", telescope_builtin.live_grep, "Telescope - Live Grep")
map("n", "<leader>fd", telescope_builtin.diagnostics, "Telescope - Diagnostics")
map("n", "<leader><leader>", telescope_builtin.buffers, "Telescope - Existing Buffers")
map("n", "<leader>fh", require("telescope").extensions.recent_files.pick, "Telescope - Recent Files")
map("n", "<leader>fr", require("telescope").extensions.frecency.frecency, "Telescope - Frecent Files")
map("n", "<leader>gs", telescope_builtin.git_status, "Git Status")
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", "Telescope - TODO list")

-- Neo-Tree --
map("n", "<C-n>", ":Neotree toggle filesystem reveal left<CR>", "Neo-Tree Toggle")

-- Buffer Movement --
map("n", "<A-,>", ":BufferPrevious<CR>", "Previous Buffer", { noremap = true })
map("n", "<A-.>", ":BufferNext<CR>", "Next Buffer", { noremap = true })
-- map("n", "<leader>x", ":BufferClose<CR>", "Close Buffer", { noremap = true })

map("n", "<A-<>", ":BufferMovePrevious<CR>", "Move Buffer Previous", { noremap = true })
map("n", "<A->>", ":BufferMoveNext<CR>", "Move Buffer Next", { noremap = true })

map("n", "<A-1>", ":BufferGoto 1<CR>", "Move to Buffer 1", { noremap = true })
map("n", "<A-2>", ":BufferGoto 2<CR>", "Move to Buffer 2", { noremap = true })
map("n", "<A-3>", ":BufferGoto 3<CR>", "Move to Buffer 3", { noremap = true })
map("n", "<A-4>", ":BufferGoto 4<CR>", "Move to Buffer 4", { noremap = true })
map("n", "<A-5>", ":BufferGoto 5<CR>", "Move to Buffer 5", { noremap = true })
map("n", "<A-6>", ":BufferGoto 6<CR>", "Move to Buffer 6", { noremap = true })
map("n", "<A-7>", ":BufferGoto 7<CR>", "Move to Buffer 7", { noremap = true })
map("n", "<A-8>", ":BufferGoto 8<CR>", "Move to Buffer 8", { noremap = true })
map("n", "<A-9>", ":BufferGoto 9<CR>", "Move to Buffer 9", { noremap = true })
map("n", "<A-0>", ":BufferLast<CR>", "Move to Last Buffer", { noremap = true })

-- Colorscheme (via Huez) --
map("n", "<leader>th", ":Huez<CR>", "Colorscheme Picker")
