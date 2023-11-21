local util = require 'util'

util.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Disable continuations
keymap.set('n', '<Leader>o', 'o<Esc>^Da', opts)
keymap.set('n', '<Leader>O', 'O<Esc>^Da', opts)

-- Jumplist
keymap.set('n', '<C-m>', '<C-i>', opts)

-- New tab
keymap.set('n', 'te', ':tabedit')
keymap.set('n', '<tab>', ':tabnext<Return>', opts)
keymap.set('n', '<s-tab>', ':tabprev<Return>', opts)

-- Split window
keymap.set('n', 'ss', ':split<Return>', opts)
keymap.set('n', 'sv', ':vsplit<Return>', opts)

-- Diagnostics
keymap.set('n', '<C-j>', function()
  vim.diagnostic.goto_next()
end, opts)
