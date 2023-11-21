--[[ opts.lua ]]
local opt = vim.opt

-- [[ Context ]]
opt.colorcolumn = '100'
opt.textwidth = 100
opt.number = true
opt.ruler = true
-- opt.relativenumber = true
opt.scrolloff = 5
opt.signcolumn = "yes"

-- [[ Filetypes ]]
opt.encoding = 'utf8'
opt.fileencoding = 'utf8'

-- [[ Theme ]]
opt.syntax = "ON"
opt.statusline = '  %l,%c: %f %h%w%m%r'

-- Otherwise nvim 'claims' right-clicks and also Command-C doesn't work
opt.mouse = ""

-- [[ Search ]]
opt.incsearch = true
opt.hlsearch = true

-- [[ Whitespace ]]
opt.smarttab = true
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

-- http://stackoverflow.com/questions/11560201/backspace-key-not-working-in-vim-vi#11560415
opt.backspace = "2"

-- [[ Splits ]]
opt.splitright = true
opt.splitbelow = true

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
opt.completeopt = {'menuone', 'noselect', 'noinsert'}
opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
