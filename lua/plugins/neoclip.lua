return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    "kkharji/sqlite.lua",
  },
  event = "VeryLazy", -- #TODO: temp fix, otherwise we loose the first yank
  keys = {
    { "<leader>y", "<cmd>Telescope neoclip<CR>", desc = "Neoclip (Yank History)" },
  },
  config = function()
    require("neoclip").setup({})
    require("telescope").load_extension("neoclip")
  end,
}
