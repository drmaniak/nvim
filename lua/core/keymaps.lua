
-- Map leader (needs to be done for Lazy to work)
require("helpers.keys").set_leader(" ")

------------------------
-- Set Custom Keymaps --
------------------------

local map = require("helpers.keys").map

-- Vim commands --
map('i', 'kj', '<ESC>')
map('i', 'jk', '<ESC>')

-- Plugin controls --
