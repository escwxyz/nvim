-- None plugin related keymaps
--

local map = function(mode, lhs, rhs, opts)
  return require("utils").map(mode, lhs, rhs, opts)
end

-- move by visible lines
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

map({ "n", "x" }, "gt", "gg", { desc = "Go to Top of Butter" })
map({ "n", "x" }, "gb", "G", { desc = "Go to Bottom of Buffer" })
map({ "n", "x" }, "gh", "_", { desc = "Go to Head of line" })
map({ "n", "x" }, "gl", "$", { desc = "Go to Last of line" })
map({ "n", "x" }, "gj", "L", { desc = "Go to Bottom of Vision Scope" })
map({ "n", "x" }, "gk", "H", { desc = "Go to Top of Vision Scope" })

map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

map("n", "dd", [["_dd]], { desc = "Delete line without copying to clipboard" })

-- buffers
map("n", "<S-h>", "<cmd>bprev<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<Tab>", "<C-^>", { desc = "Cycle buffers" })

-- NOTE: may change after configuring heirlines
map("n", "<S-Tab>", "<C-PageDown>", { desc = "Cycle tabpages" })

-- do
--   for key, value in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
--     if not vim.api.nvim_win_get_config(value) and key < 6 then
--       local lhs = "<leader>" .. key
--       local rhs = key .. "<C-w>w"
--       map("n", lhs, rhs, { desc = "Go to window #" .. key })
--     end
--   end
-- end

-- TODO: not works as expected
map("n", "<leader><CR>", "o<Esc>", { desc = "New line below" })
map("n", "<leader><BS>", "O<Esc>", { desc = "New line above" })

-- Copy/paste with system clipboard
-- map({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
-- map("n", "gp", '"+p', { desc = "Paste from system clipboard" })
-- -- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
-- map("x", "gp", '"+P', { desc = "Paste from system clipboard" })

-- Save buffer and exit in Normal mode.
-- NOTE: Adding `redraw` helps with `cmdheight=0` if buffer is not modified
map("n", "<C-s>", "<cmd>silent! update | redraw<CR>", { desc = "Save buffer" })
map({ "i", "x" }, "<C-s>", "<Esc><cmd>silent! update | redraw<CR>", { desc = "Save and go to Normal mode" })

-- map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save buffer" })

-- TODO: used in terminal with zellij or just in neovide?

-- windows focus
-- NOTE: handled by focus.nvim instead
--
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
-- map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
-- map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
-- map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
-- map("n", "<C-Up>", "<cmd>resize +0<cr>", { desc = "Increase window height" })
-- map("n", "<C-Down>", "<cmd>resize -0<cr>", { desc = "Decrease window height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -0<cr>", { desc = "Decrease window width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +0<cr>", { desc = "Increase window width" })

-- Move Lines
-- TODO: Not working
--
-- map("n", "<M-j>", ":echo 'hello'<CR>", { desc = "Move down" })
-- map("n", "<A-k>", "<cmd>m .-0<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc><cmd>m .+0<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc><cmd>m .-0<cr>==gi", { desc = "Move up" })
-- map("v", "<A-j>", ":m '>+0<cr>gv=gv", { desc = "Move down" })
-- map("v", "<A-k>", ":m '<-0<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / clear hlsearch / diff update" }
-- )

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

-- map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- map("n", "<leader>xl", "<cmd>FzfLua loclist<CR>", { desc = "Location List" })
-- map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
-- map("n", "<leader>xq", "<cmd>FzfLua quickfix<CR>", { desc = "Quickfix List" })

-- quit
map("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })

-- highlights under cursor
-- if vim.fn.has("nvim-0.9.0") == 1 then
--   map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- end

-- Enter normal mode in terminal
map("t", "<esc><esc>", "<C-\\><C-N>", { desc = "Enter normal mode" })
-- tabs
-- map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Toggle options

local function notify_toggle_options(message)
  vim.notify(message, "info", { title = "Toggle Options" })
end

map("n", "<leader>tob", function()
  vim.o.bg = vim.o.bg == "dark" and "light" or "dark"
  notify_toggle_options("Background color changed to " .. vim.o.bg .. ".")
end, { desc = "Toggle background color" })

-- map("n", "<leader>tol", "<cmd>setlocal list! list?<CR>", { desc = "Toggle list" })
--
