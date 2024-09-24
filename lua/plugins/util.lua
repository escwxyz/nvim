return {
  {
    "axieax/urlview.nvim",
    cmd = {
      "UrlView",
    },
    opts = {
      default_action = "system",
      jump = {
        prev = "[u",
        next = "]u",
      },
    },
  },
  {
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
    opts = {},
  },
  -- TODO: https://github.com/mistricky/codesnap.nvim/issues/103
  {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
      {
        "<leader>-",
        "<Esc><cmd>CodeSnap<CR>",
        mode = "x",
        desc = "Save selected code snapshot into clipboard",
      },
      {
        "<leader>=",
        "<Esc><cmd>CodeSnapSave<CR>",
        mode = "x",
        desc = "Save selected code snapshot in ~/Pictures",
      },
    },
    opts = {
      save_path = "~/Pictures",
      code_font_family = "JetBrainsMono Nerd Font Mono",
      has_breadcrumbs = false,
      has_line_number = true,
      bg_theme = "bamboo",
      watermark = "",
    },
  },
  {
    "willothy/flatten.nvim",
    priority = 1001,
    opts = {
      window = {
        open = "alternate",
      },
    },
  },
}
