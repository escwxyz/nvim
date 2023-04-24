return {
  "ahmedkhalf/project.nvim",
  opts = {},
  event = "VeryLazy",
  config = function(_, opts)
    require("project_nvim").setup(opts)
    require("telescope").load_extension("projects")
  end,
  keys = {
    { "<leader>p", "<cmd>Telescope projects<CR>", desc = "Projects" },
  },
}
