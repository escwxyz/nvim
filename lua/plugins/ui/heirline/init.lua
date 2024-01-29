return {
  "rebelot/heirline.nvim",
  event = "UiEnter",
  config = function()
    -- local tabline = require("plugins.ui.heirline.components.tabline")
    local statusline = require("plugins.ui.heirline.components.statusline")

    require("heirline").setup({
      statusline = statusline,
      -- tabline = tabline,
    })
  end,
}
