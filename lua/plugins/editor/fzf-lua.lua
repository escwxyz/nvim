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
      desc = "[Fzf] Search help tags",
    },
    {
      "<leader>/H",
      "<cmd>FzfLua highlights<CR>",
      desc = "[Fzf] Search highlights",
    },

    {
      "<leader>/c",
      "<cmd>FzfLua commands<CR>",
      desc = "[Fzf] Search commands",
    },
    {
      "<leader>/k",
      "<cmd>FzfLua keymaps<CR>",
      desc = "[Fzf] Search keymaps",
    },
    {
      "/",
      "<cmd>FzfLua blines<CR>",
      desc = "[Fzf] Search in buffer",
    },
    {
      "<leader>/f",
      "<cmd>FzfLua files<CR>",
      desc = "[Fzf] Search files",
    },
    {
      "<leader>/s",
      "<cmd>FzfLua live_grep<CR>",
      desc = "[Fzf] Live grep",
    },
    {
      "<leader>//",
      "<cmd>FzfLua resume<CR>",
      desc = "[Fzf] Resume",
    },
    {
      "<leader>/b",
      "<cmd>FzfLua buffers<CR>",
      desc = "[Fzf] Search buffers",
    },
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
