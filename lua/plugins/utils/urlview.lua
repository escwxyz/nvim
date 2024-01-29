return {
  "axieax/urlview.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>u", "<cmd>UrlView<CR>", desc = "View buffer urls" },
    { "<leader>U", "<cmd>UrlView lazy<CR>", desc = "View plugin urls" },
  },
  config = true,
}
