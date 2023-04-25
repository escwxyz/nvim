return {
  "ahmedkhalf/project.nvim",
  event = false, -- disable laoding on startup
  keys = false,
  cmd = "Telescope projects",
  config = function(_, opts)
    require("project_nvim").setup(opts)
    require("telescope").load_extension("projects")
    vim.keymap.set("n", "<leader>p", "<cmd>Telescope projects<CR>", { desc = "Projects" })
  end,
}
