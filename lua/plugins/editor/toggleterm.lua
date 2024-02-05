-- TODO: guicursor sometimes disappears in terminal
-- currently not support multiple terminals in different layouts
-- see: https://github.com/akinsho/toggleterm.nvim/issues/533
-- maybe https://github.com/NvChad/nvterm is worth to check out
return {
  "akinsho/toggleterm.nvim",
  keys = {
    {
      "<leader>gl",
      function()
        local lazygit = require("toggleterm.terminal").Terminal:new({
          cmd = "lazygit",
          direction = "float",
          hidden = true,
          close_on_exit = true,
          on_open = function(term)
            vim.cmd("startinsert!")
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
          end,
          on_close = function(_)
            vim.cmd("startinsert!")
          end,
        })

        lazygit:toggle()
      end,
      desc = "Lazygit",
    },
    {
      "<C-\\>",
      "<cmd>execute v:count . 'ToggleTerm'<CR>",
      desc = "Toggle terminal",
    },
  },
  opts = {
    direction = "horizontal",
    start_in_insert = false,
    insert_mappings = false,
    float_opts = {
      border = "curved",
      title_pos = "center",
    },
  },
}
