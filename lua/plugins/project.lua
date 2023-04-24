-- TODO: not overridden yet
return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({})
    require("telescope").load_extension("projects")
  end,
  cmd = "Telescope projects",
  keys = {
    { "<leader>p", "<cmd>Telescope projects<CR>", desc = "Projects" },
  },
}
