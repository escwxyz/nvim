return {
  "rmagatti/goto-preview",
  keys = {
    {
      "gpd",
      function()
        require("goto-preview").goto_preview_definition({})
      end,
      desc = "Goto preview definition",
    },

    {
      "gpt",
      function()
        require("goto-preview").goto_preview_type_definition({})
      end,
      desc = "Goto preview type definition",
    },
    {
      "gpi",
      function()
        require("goto-preview").goto_preview_implementation({})
      end,
      desc = "Goto preview implementation",
    },
    {
      "gpq",
      function()
        require("goto-preview").close_all_win()
      end,
      desc = "Goto preview quit",
    },

    {
      "gpr",
      function()
        require("goto-preview").goto_preview_references()
      end,
      desc = "Goto preview references",
    },
  },

  opts = {
    opacity = 80,
    dismiss_on_move = true,
    references = {
      telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
    },
  },
}
