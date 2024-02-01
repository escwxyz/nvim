-- https://github.com/echasnovski/mini.nvim/blob/main/lua/mini/basics.lua#L429
--
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- font
opt.guifont = "JetBrainsMono Nerd Font:h14"

opt.autowrite = true
opt.breakindent = false
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3
opt.confirm = true
opt.expandtab = true
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global status line
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.ruler = false
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.timeout = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

-- UI
opt.cursorline = false
opt.pumblend = 10 -- Popup blend
opt.pumheight = 20 -- Maximum number of entries in a popup
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.showmode = false -- Dont show mode since we have a statusline
opt.showtabline = 2 -- always show tabline
opt.winblend = 10 -- Transparent level of floating windows

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end

if vim.fn.has("nvim-0.10") == 0 then
  opt.termguicolors = true -- True color support
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

if vim.g.neovide then
  require("configs.neovide")
end
