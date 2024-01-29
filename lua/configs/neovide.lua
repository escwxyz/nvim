-- TODO: hightlight is currently mess in neovide
--
-- See https://neovide.dev/configuration.html#configuration
vim.opt.cmdheight = 0
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_confirm_quit = true
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.transparency = 0.8
vim.g.neovide_transparency = 0.0
vim.g.neovide_transparency_point = 0.8
vim.g.neovide_floating_blur_amount_x = 3.0
vim.g.neovide_floating_blur_amount_y = 3.0
vim.g.neovide_floating_shadow = true
vim.g.neovide_unlink_border_highlights = true
vim.g.neovide_refresh_rate_idle = 5

if vim.fn.has("mac") then
  vim.g.neovide_window_blurred = true
  vim.g.neovide_background_color = "#0f1117" .. require("utils").alpha()

  vim.g.neovide_input_macos_alt_is_meta = true

  -- keymaps
  --
  --TODO: not working
  --
  -- vim.keymap.set({ "n", "v", "o" }, "<D-]>", function()
  --   require("utils").change_transparency(0.01)
  -- end)
  --
  -- vim.keymap.set({ "n", "v", "o" }, "<D-[>", function()
  --   require("utils").change_transparency(-0.01)
  -- end)

  -- vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  -- vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  -- vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  -- vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  -- vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end
