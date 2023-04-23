return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  keys = { { "<leader>o", "<cmd>Oil --float<CR>", desc = "Oil file manager" } },
  opts = {
    columns = {
      "icon",
      { "mtime", highlight = "Comment", format = "%T %y-%m-%d" },
    },
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
  },
}
