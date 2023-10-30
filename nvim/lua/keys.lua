-- [[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- [[ Force use of hjkl ]]
map('n', '<Up>', '<NOP>', {})
map('n', '<Down>', '<NOP>', {})
map('n', '<Left>', '<NOP>', {})
map('n', '<Right>', '<NOP>', {})
