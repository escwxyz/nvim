return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    timeout = 3000,
    stages = "fade",
    icons = require("configs.icons").log_levels,
    fps = 60,
    background_colour = "#293136", -- FIX: temp fix
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
    -- on_open = function(win)
    --   vim.api.nvim_win_set_config(win, { zindex = 100 })
    -- end,
  },
  init = function()
    vim.notify = require("notify")
  end,
  keys = {
    {
      "<leader>fn",
      function()
        require("plugins.rcarriga.nvim-notify.utils").find_notifications()
      end,
      desc = "Find notification history",
    },
  },
}
