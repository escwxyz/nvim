return {
  "echasnovski/mini.clue",
  version = false,
  event = "VeryLazy",
  config = function()
    local miniclue = require("mini.clue")
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<leader>" },
        { mode = "x", keys = "<leader>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },

      clues = {
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        -- TODO:
        {
          mode = "n",
          keys = "<leader>/",
          desc = "+FzfLua",
        },
        {
          mode = "n",
          keys = "<leader>n",
          desc = "+Neogen",
        },
        {
          mode = "n",
          keys = "<leader>s",
          desc = "+Snippets",
        },
        {
          mode = "n",
          keys = "<leader>t",
          desc = "+Toggle",
        },
        {
          mode = "n",
          keys = "<leader>to",
          desc = "+Options",
        },
        {
          mode = "n",
          keys = "<leader>g",
          desc = "+Git",
        },
      },

      window = {
        delay = 500,
        -- config = {
        --     border = "curved",
        -- }
      },
    })
  end,
}
