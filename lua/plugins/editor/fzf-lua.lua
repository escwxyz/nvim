return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "FzfLua",
  keys = {
    {
      "<leader>?",
      "<cmd>FzfLua help_tags<CR>",
      desc = "Help tags",
    },
    {
      "<leader>.",
      "<cmd>FzfLua commands<CR>",
      desc = "Commands",
    },
    {
      "<leader>,",
      "<cmd>FzfLua keymaps<CR>",
      desc = "Keymaps",
    },
    {
      "/",
      "<cmd>FzfLua blines<CR>",
      desc = "Search in buffer",
    },
    {
      "<leader>ff",
      "<cmd>FzfLua files<CR>",
      desc = "[F]ind [F]iles",
    },
    {
      "<leader>fs",
      "<cmd>FzfLua live_grep<CR>",
      desc = "[F]ind [S]trings",
    },
    -- TODO: add more
  },
  opts = {
    winopts = {
      preview = {
        default = "bat",
      },
    },
    previewers = {
      bat = {
        theme = "ansi",
      },
    },
  },
}
