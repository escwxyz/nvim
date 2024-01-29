local git_status_icons = require("configs.icons").git_status

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "[E]xplorer NeoTree",
    },
  },
  -- -- TODO:
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  opts = {
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          -- added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          -- modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
          -- deleted   = "✖",-- this can only be used in the git_status source
          -- renamed   = "󰁕",-- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
          added = git_status_icons.added,
          modified = git_status_icons.modified,
          deleted = git_status_icons.deleted,
          renamed = git_status_icons.renamed,
          -- TODO
        },
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
          require("neo-tree").close_all()
        end,
      },
    },
  },
}
