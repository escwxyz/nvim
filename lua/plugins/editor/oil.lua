return {
  "stevearc/oil.nvim",
  keys = { { "<leader>o", "<cmd>Oil --float<CR>", desc = "[O]il file manager" } },
  opts = {
    columns = {
      "icon",
      { "mtime", highlight = "Comment", format = "%T %y-%m-%d" },
    },
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 3,
      win_options = {
        winblend = 10,
      },
    },
  },
}
