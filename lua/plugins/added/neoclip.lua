return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    "kkharji/sqlite.lua",
  },
  cmd = "Telescope neoclip",
  keys = {
    { "<leader>y", "<cmd>Telescope neoclip<CR>", desc = "Neoclip (Yank History)" },
  },
  config = function()
    require("neoclip").setup({})
    require("telescope").load_extension("neoclip")
  end,
}
