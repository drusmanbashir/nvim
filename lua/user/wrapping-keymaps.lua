local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
    
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "


keymap("v","<leader>w[",[[c[<c-r>"]<esc>]],opts)
keymap("v","<leader>wa",[[c<<c-r>"><esc>]],opts)
keymap("v","<leader>wb",[[c(<c-r>")<esc>]],opts)
