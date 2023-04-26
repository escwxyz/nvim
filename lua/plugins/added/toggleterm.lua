return {
  "akinsho/toggleterm.nvim",
  cmd = "ToggleTerm",
  keys = {
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Toggle horizontal terminal" },
    { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>", desc = "Toggle vertical terminal" },
  },
  config = {
    shade_terminals = true,
  },
}
