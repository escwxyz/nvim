-- TODO: hightlight is currently mess in neovide

-- See https://neovide.dev/configuration.html#configuration
-- vim.opt.cmdheight = 0 -- scaling not working when this is set
vim.g.neovide_hide_mouse_when_typing = false
vim.g.neovide_confirm_quit = true
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_transparency = 0.5
-- vim.g.neovide_transparency_point = 0.8
vim.g.neovide_floating_blur_amount_x = 3.0
vim.g.neovide_floating_blur_amount_y = 3.0
vim.g.neovide_floating_shadow = true
vim.g.neovide_unlink_border_highlights = true
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_scale_factor = 1.0

if vim.fn.has("mac") then
  -- vim.g.neovide_window_blurred = true
  -- WARN: we don't need this anymore, we use `frame` in the config file
  -- See https://github.com/neovide/neovide/pull/2168#issuecomment-1913185071
  -- vim.g.neovide_background_color = "#0f1117" .. require("utils.neovide").alpha()

  vim.g.neovide_input_macos_alt_is_meta = true

  -- keymaps

  vim.keymap.set("n", "<D-=>", function()
    require("utils.neovide").change_scale_factor(1.1)
  end, { desc = "Increase scale factor", silent = true })

  vim.keymap.set("n", "<D-->", function()
    require("utils.neovide").change_scale_factor(1 / 1.1)
  end, { desc = "Decrease scale factor", silent = true })

  -- vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  -- vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  -- vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  -- vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  -- vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end
