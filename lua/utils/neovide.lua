local function alpha()
  return string.format("%x", math.floor((vim.g.transparency or 0.8) * 255))
end

--- Change neovide background transparency
---@param delta number
---
local function change_transparency(delta)
  vim.g.neovide_transparency_point = vim.g.neovide_transparency_point + delta
  vim.g.neovide_background_color = "#0f1117" .. alpha()
end

--- Change scale factor
---@param delta number
local function change_scale_factor(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

local M = {
  alpha = alpha,
  change_transparency = change_transparency,
  change_scale_factor = change_scale_factor,
}

return M
