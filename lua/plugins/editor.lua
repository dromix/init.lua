return {
  {
    enabled = false,
    'folke/flash.nvim',
    ---@type Flash.Config
    opts = {
      search = {
        forward = true,
        multi_window = false,
        wrap = false,
        incremental = true,
      },
    },
  },

  {
    'dinhhuy258/git.nvim',
    event = 'BufReadPre',
    opts = {
      keymaps = {
        -- Open blame window
        blame = '<Leader>gb',
        -- Open file/folder in git repository
        browse = '<Leader>go',
      },
    },
  },

  {
    'telescope.nvim',
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      'nvim-telescope/telescope-file-browser.nvim',
    },
    keys = {
      {
        '<leader>pv',
        function()
          local telescope = require 'telescope'

          local function telescope_buffer_dir()
            return vim.fn.expand '%:p:h'
          end

          telescope.extensions.file_browser.file_browser {
            path = '%:p:h',
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = 'normal',
            layout_config = { height = 40 },
          }
        end,
        desc = 'Open File Browser with the path of the current buffer',
      },
      {
        '<leader>?',
        function()
          require('telescope.builtin').oldfiles()
        end,
        desc = '[?] Find recently opened files',
      },
      {
        '<leader><space>',
        function()
          require('telescope.builtin').buffers()
        end,
        desc = '[ ] Find existing buffers',
      },
      {
        '<leader>gf',
        function()
          require('telescope.builtin').git_files()
        end,
        desc = 'Search [G]it [F]iles',
      },
      {
        '<leader>sf',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = '[S]earch [F]iles',
      },
      {
        '<leader>sh',
        function()
          require('telescope.builtin').help_tags()
        end,
        desc = '[S]earch [H]elp',
      },
      {
        '<leader>sw',
        function()
          require('telescope.builtin').grep_string()
        end,
        desc = '[S]earch current [W]ord',
      },
      {
        '<leader>sg',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = '[S]earch by [G]rep',
      },
      {
        '<leader>sd',
        function()
          require('telescope.builtin').diagnostics()
        end,
        desc = '[S]earch [D]iagnostics',
      },
      {
        '<leader>sr',
        function()
          require('telescope.builtin').resume()
        end,
        desc = '[S]earch [R]esume',
      },
      {
        '<leader>/',
        function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end,
        desc = '[/] Fuzzily search in current buffer',
      },
    },
    config = function(_, opts)
      local telescope = require 'telescope'
      local actions = require 'telescope.actions'
      local fb_actions = require('telescope').extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend('force', opts.defaults, {
        wrap_results = true,
        layout_strategy = 'horizontal',
        layout_config = { prompt_position = 'top' },
        sorting_strategy = 'ascending',
        winblend = 0,
        file_ignore_patterns = {"node_modules"},
        mappings = {
          n = {},
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = 'ivy',
          initial_mode = 'normal',
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          theme = 'dropdown',
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ['n'] = {
              -- your custom normal mode mappings
              ['N'] = fb_actions.create,
              ['h'] = fb_actions.goto_parent_dir,
              ['/'] = function()
                vim.cmd 'startinsert'
              end,
              ['<C-u>'] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ['<C-d>'] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ['<PageUp>'] = actions.preview_scrolling_up,
              ['<PageDown>'] = actions.preview_scrolling_down,
            },
          },
        },
      }
      telescope.setup(opts)
      require('telescope').load_extension 'fzf'
      require('telescope').load_extension 'file_browser'
    end,
  },
}

