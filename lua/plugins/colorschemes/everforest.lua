return {
  "neanias/everforest-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local everforest = require("everforest")

    everforest.setup({
      background = "hard",
      transparent_background_level = 2,
      ui_contrast = "high",
      -- NOTE: seems not working, still use `tint.nvim`
      dim_inactive_windows = false,
      show_eob = false,
    })

    everforest.load()
  end,
}
