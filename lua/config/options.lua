-- Leader keys
vim.g.mapleader = " " -- Set space as the leader key
vim.g.maplocalleader = ' ' -- Set space as the local leader key

-- Encoding settings
vim.scriptencoding = "utf-8" -- Set script encoding to UTF-8
vim.opt.encoding = "utf-8" -- Set internal Neovim encoding to UTF-8
vim.opt.fileencoding = "utf-8" -- Set file encoding to UTF-8

-- UI options
vim.opt.number = true -- Show line numbers
vim.opt.title = true -- Set terminal's title to reflect the file name being edited
vim.opt.autoindent = true -- Enable autoindenting
vim.opt.smartindent = true -- Make indenting smarter again
vim.opt.hlsearch = true -- Highlight search results
vim.opt.backup = false -- Do not keep a backup file
vim.opt.showcmd = true -- Show command in the bottom bar
vim.opt.cmdheight = 1 -- Height of the command bar
vim.opt.laststatus = 2 -- Always display the status line
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.shell = "zsh" -- Use Zsh for shell commands
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" } -- Do not create backups for files in these paths
vim.opt.inccommand = "split" -- Show incremental commands in a split
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true
vim.opt.smarttab = true -- Insert tabs on the start of a line according to shiftwidth
vim.opt.breakindent = true -- Enable break indent
vim.opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
vim.opt.wrap = false -- Do not wrap lines
vim.opt.backspace = { "start", "eol", "indent" } -- Allow backspacing over everything in insert mode
vim.opt.path:append({ "**" }) -- Search down into subdirectories
vim.opt.wildignore:append({ "*/node_modules/*" }) -- Ignore these patterns when completing file names
vim.opt.splitbelow = true -- Split windows below the current window
vim.opt.splitright = true -- Split windows to the right of the current window
vim.opt.splitkeep = "cursor" -- Keep the cursor position when splitting windows

-- Mouse support
vim.o.mouse = 'a' -- Enable mouse in all modes

-- Undercurl settings for color terminals
vim.opt.termguicolors = true -- Enable true color support
vim.cmd([[let &t_Cs = "\e[4:3m"]]) -- Set undercurl start sequence
vim.cmd([[let &t_Ce = "\e[4:0m"]]) -- Set undercurl end sequence

-- Formatting options
vim.opt.formatoptions:append({ "r" }) -- Automatically insert the current comment leader after hitting <Enter> in Insert mode

-- Filetype settings
vim.cmd([[au BufNewFile,BufRead *.astro setf astro]]) -- Set filetype to 'astro' for .astro files
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]]) -- Set filetype to 'ruby' for Podfile

-- Neovim 0.8 specific settings
if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0 -- Remove command line height in Neovim 0.8
end


-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Save undo history
vim.o.undofile = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'