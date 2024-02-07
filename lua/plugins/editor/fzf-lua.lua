return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "FzfLua",
  keys = {
    {
      "<leader>/h",
      "<cmd>FzfLua help_tags<CR>",
      desc = "Search help tags",
    },
    {
      "<leader>/H",
      "<cmd>FzfLua highlights<CR>",
      desc = "Search highlights",
    },

    {
      "<leader>/c",
      "<cmd>FzfLua commands<CR>",
      desc = "Search commands",
    },
    {
      "<leader>/k",
      "<cmd>FzfLua keymaps<CR>",
      desc = "Search keymaps",
    },
    {
      "/",
      "<cmd>FzfLua blines<CR>",
      desc = "Search in buffer",
    },
    {
      "<leader>/f",
      "<cmd>FzfLua files<CR>",
      desc = "Search files",
    },
    {
      "<leader>/r",
      "<cmd>FzfLua oldfiles<CR>",
      desc = "Search recent files",
    },
    {
      "<leader>/s",
      "<cmd>FzfLua live_grep<CR>",
      desc = "Live grep",
    },
    {
      "<leader>//",
      "<cmd>FzfLua resume<CR>",
      desc = "Resume last command",
    },
    {
      "<leader>/b",
      "<cmd>FzfLua buffers<CR>",
      desc = "Search buffers",
    },
  },
  -- TODO: https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#default-options
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
