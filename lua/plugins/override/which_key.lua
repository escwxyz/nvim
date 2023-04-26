return {
  "folke/which-key.nvim",
  opts = {
    plugins = {
      marks = false,
    },
    defaults = {
      mode = { "n" },
      ["<leader>t"] = { name = "+terminal" },
      ["<leader>r"] = { name = "+test runner" },
      ["<leader>n"] = { name = "+neogen" },
    },
  },
}
