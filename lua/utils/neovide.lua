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

local M = {
  alpha = alpha,
  change_transparency = change_transparency,
}

return M
