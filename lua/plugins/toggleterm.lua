return {
  "akinsho/toggleterm.nvim",
  config = true,
  cmd = "ToggleTerm",
  keys = { { "<c-t>", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" } },
  opts = {
    open_mapping = [[<c-t>]],
    direction = "float",
    float_opts = {
      border = "curved",
    },
  },
}
