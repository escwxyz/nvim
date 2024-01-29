return {
  "folke/zen-mode.nvim",
  keys = { { "<leader>zz", "<cmd>ZenMode<CR>", desc = "Toggle ZenMode" } },
  opts = {
    window = {
      backdrop = 0.95,
      width = 120,
      height = 1,
      options = {
        cursorline = false,
        cursorcolumn = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      gitsigns = {
        enabled = false,
      },
    },
    on_open = function()
      vim.g.ZenMode = true
    end,
    on_close = function()
      vim.g.ZenMode = false
    end,
  },
}
