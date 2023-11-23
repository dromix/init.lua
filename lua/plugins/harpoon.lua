return {
  {
    'theprimeagen/harpoon',
    config = function()
      -- Require Harpoon modules
      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      -- Setting up the key mappings
      vim.keymap.set('n', '<leader>a', mark.add_file)
      vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

      vim.keymap.set('n', 'sj', function()
        ui.nav_file(1)
      end)
      vim.keymap.set('n', 'sl', function()
        ui.nav_file(2)
      end)
      vim.keymap.set('n', 'sn', function()
        ui.nav_file(3)
      end)
      vim.keymap.set('n', 'sx', function()
        ui.nav_file(4)
      end)
    end,
  },
}
