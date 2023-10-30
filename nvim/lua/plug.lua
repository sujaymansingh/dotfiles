--[[ plug.lua ]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup({
    'tanvirtin/monokai.nvim',
    'rust-lang/rust.vim',
    {'neoclide/coc.nvim',  branch = 'release'},
})

require('monokai').setup {}
require('monokai').setup { palette = require('monokai').ristretto }

require('cocconfig')

-- :CocInstall coc-rust-analyzer
