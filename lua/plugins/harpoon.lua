return {
  "ThePrimeagen/harpoon",
  lazy = true,
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon.mark").add_file()
        vim.notify("Mark added")
      end,
      desc = "[Harpoon] Add mark",
    },
    {
      "<leader>m",
      "<cmd>Telescope harpoon marks<CR>",
      desc = "[Harpoon] Marks",
    },
    {
      "<leader>]",
      function()
        require("harpoon.ui").nav_next()
      end,
      desc = "[Harpoon] Next mark",
    },
    {
      "<leader>[",
      function()
        require("harpoon.ui").nav_prev()
      end,
      desc = "[Harpoon] Prev mark",
    },
  },
  config = true,
}
