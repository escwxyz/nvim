return {
  "danymat/neogen",
  keys = {
    {
      "<leader>nf",
      "<cmd>Neogen func<CR>",
      desc = "[Neogen] Function",
    },
    {
      "<leader>nc",
      "<cmd>Neogen class<CR>",
      desc = "[Neogen] Class",
    },
    {
      "<leader>nt",
      "<cmd>Neogen type<CR>",
      desc = "[Neogen] Type",
    },
  },
  config = function()
    require("neogen").setup({
      snippet_engine = "luasnip",
    })
  end,
}
