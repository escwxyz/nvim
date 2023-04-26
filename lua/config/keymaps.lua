-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
--
map({ "n", "x" }, "gt", "gg", { desc = "Go to Top of Butter" })
map({ "n", "x" }, "gb", "G", { desc = "Go to Bottom of Buffer" })
map({ "n", "x" }, "gh", "_", { desc = "Go to Head of line" })
map({ "n", "x" }, "gl", "$", { desc = "Go to Last of line" })
map({ "n", "x" }, "gj", "L", { desc = "Go to Bottom of Vision Scope" })
map({ "n", "x" }, "gk", "H", { desc = "Go to Top of Vision Scope" })

map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- do
--   for key, value in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
--     if not vim.api.nvim_win_get_config(value) and key < 6 then
--       local lhs = "<leader>" .. key
--       local rhs = key .. "<C-w>w"
--       map("n", lhs, rhs, { desc = "Go to window #" .. key })
--     end
--   end
-- end

map("n", "<leader><CR>", "o<Esc>", { desc = "New line below" })
map("n", "<leader><BS>", "O<Esc>", { desc = "New line above" })

-- TODO: need to adjust zellij keymaps to remove conflicts or just use zellij's lock mode
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +0<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -0<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -0<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +0<cr>", { desc = "Increase window width" })

-- Move Lines
-- TODO: Not working
map("n", "<M-j>", ":echo 'hello'<CR>", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-0<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+0<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-0<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+0<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-0<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map("n", "<leader>\\", "<cmd>:Lazy<CR>", { desc = "Lazy Plugins" })

-- toggle options
-- map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
-- map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
-- map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- map("n", "<leader>ul", function() Util.toggle("relativenumber", true) Util.toggle("number") end, { desc = "Toggle Line Numbers" })
-- map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
-- local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
-- map("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })

-- lazygit
-- map("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false }) end, { desc = "Lazygit (root dir)" })
-- map("n", "<leader>gG", function() Util.float_term({ "lazygit" }, {esc_esc = false}) end, { desc = "Lazygit (cwd)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- floating terminal
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- windows
-- TODO:
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>j", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>l", "<C-W>v", { desc = "Split window right" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Remove lazyvim keymaps
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>`")
