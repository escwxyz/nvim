-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

-- cargo toml support
vim.api.nvim_create_autocmd("BufRead", {
  group = augroup("cmp_source_cargo"),
  pattern = "Cargo.toml",
  callback = function()
    local ok, cmp = pcall(require, "cmp")
    if not ok then
      return
    end
    cmp.setup.buffer({ sources = { { name = "crates" } } })
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "config.fish" },
  command = "execute 'silent !source <afile> --silent'",
  group = augroup("fish_config"),
})