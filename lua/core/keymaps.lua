
----------------------------------------
-- Leader is mapped in /core/lazy.lua --
----------------------------------------


------------------------
-- Set Custom Keymaps --
------------------------

local map = require("helpers.keys").map   -- map signature (mode:str, lhs:str, rhs:str, desc:str, opts:table)


-- Vim commands --
map('i', 'kj', '<ESC>', "", { noremap = true })
map('i', 'jk', '<ESC>', "", { noremap = true })

---------------------
-- Plugin controls --
---------------------

-- Telescope --
local telescope_builtin = require("telescope.builtin")
map("n", "<leader>ff", telescope_builtin.find_files, "Find File")
map("n", "<leader>fg", telescope_builtin.live_grep, "Live Grep")
map("n", "<leader>gs", telescope_builtin.git_status, "Git Status")

-- Neo-Tree --
map("n", "<C-n>", ":Neotree toggle filesystem reveal left<CR>", "Neo-Tree Toggle")
