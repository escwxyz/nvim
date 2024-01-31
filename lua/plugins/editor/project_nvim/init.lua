-- TODO: migrate to https://github.com/coffebar/neovim-project
return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>p",
      function()
        require("plugins.editor.project_nvim.utils").find_recent_projects()
      end,
      desc = "[P]rojects",
    },
  },
  config = function()
    require("project_nvim").setup({})
  end,
}
