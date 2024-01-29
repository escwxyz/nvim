return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    "kkharji/sqlite.lua",
    "ibhagwan/fzf-lua",
  },
  keys = {
    { "<leader>y", "<cmd>:lua require('neoclip.fzf')()<CR>", desc = "Neoclip (Yank History)" },
  },
  config = function()
    require("neoclip").setup({})
  end,
}
