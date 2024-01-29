return {
  "ggandor/leap.nvim",
  dependencies = {
    { "tpope/vim-repeat" },
  },
  event = "VeryLazy",
  config = function()
    vim.keymap.set({ "n", "x", "o" }, "S", function()
      require("leap").leap({
        target_windows = vim.tbl_filter(function(win)
          return vim.api.nvim_win_get_config(win).focusable
        end, vim.api.nvim_tabpage_list_wins(0)),
      })
    end, { desc = "[Leap] Window" })

    vim.keymap.set({ "n", "x", "o" }, "s", function()
      require("leap").leap({ target_windows = { vim.fn.win_getid() } })
    end, { desc = "[Leap] Buffer" })
  end,
}

