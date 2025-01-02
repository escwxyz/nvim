-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "]b")
vim.keymap.del("n", "[b")
vim.keymap.del("n", "<leader>l")
-- vim.keymap.del("n", "<leader>w")

vim.keymap.set({ "n", "x" }, "gh", "_", { desc = "Go to Head of line" })
vim.keymap.set({ "n", "x" }, "gl", "$", { desc = "Go to Last of line" })
vim.keymap.set({ "n", "x" }, "gj", "L", { desc = "Go to Bottom of Vision Scope" })
vim.keymap.set({ "n", "x" }, "gk", "H", { desc = "Go to Top of Vision Scope" })

vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

vim.keymap.set("n", "dd", [["_dd]], { desc = "Delete line without copying to clipboard" })

vim.keymap.set("n", "<leader>\\", "<cmd>Lazy<CR>", { desc = "Lazy" })

vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
