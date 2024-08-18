-- TODO: hightlight is currently mess in neovide

-- See https://neovide.dev/configuration.html#configuration
vim.opt.cmdheight = 0
vim.g.neovide_hide_mouse_when_typing = false
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_transparency = 0.2
vim.g.neovide_floating_shadow = true
vim.g.neovide_unlink_border_highlights = true
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_left = 0
vim.g.neovide_padding_right = 0

if vim.fn.has("mac") then
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 0.5
  vim.g.neovide_floating_blur_amount_y = 0.5
  vim.g.neovide_input_macos_option_is_meta = "only_left"
end
