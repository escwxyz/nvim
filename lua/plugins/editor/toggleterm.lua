return {
  "akinsho/toggleterm.nvim",
  cmd = "ToggleTerm",
  keys = function()
    local Terminal = require("toggleterm.terminal").Terminal

    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      close_on_exit = true,
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
      on_close = function(_)
        vim.cmd("startinsert!")
      end,
    })

    return {
      {
        "<leader>gl",
        function()
          lazygit:toggle()
        end,
        {
          desc = "[L]azy[G]it",
        },
      },
      -- {
      --   "<C-t>",
      --   "<cmd>ToggleTermToggleAll<CR>",
      --   desc = "Toggle all terminals",
      -- },

      -- { "<C-\\>h", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Toggle horizontal terminal" },

      -- { "<C-\\>v", "<cmd>ToggleTerm size=80 direction=vertical<CR>", desc = "Toggle vertical terminal" },

      {
        "<C-\\>",
        "<cmd>ToggleTerm direction=float<CR>",
        desc = "Floating terminal",
      },
    }
  end,
  opts = {
    float_opts = {
      border = "curved",
    },
  },
}
