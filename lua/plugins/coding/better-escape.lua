return {
    "max397574/better-escape.nvim",
    event = "ModeChanged",
    opts = {
      mapping = { "jk", "jj" },
      keys = function()
        return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<esc>l" or "<esc>"
      end,
    },
  }
  