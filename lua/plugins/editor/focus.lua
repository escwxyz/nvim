return {
  "nvim-focus/focus.nvim",
  keys = {
    {
      "<C-w>h",
      "<cmd>FocusSplitLeft<CR>",
      desc = "[Focus] or create left window",
    },

    {
      "<C-w>j",
      "<cmd>FocusSplitDown<CR>",
      desc = "[Focus] or create bottom window",
    },
    {
      "<C-w>k",
      "<cmd>FocusSplitUp<CR>",
      desc = "[Focus] or create upper window",
    },
    {
      "<C-w>l",
      "<cmd>FocusSplitRight<CR>",
      desc = "[Focus] or create right window",
    },
    {
      "<C-w>=",
      "<cmd>FocusEqualise<CR>",
      desc = "Equalise all the splits",
    },
    {
      "<C-w>-",
      "<cmd>FocusSplitNicely<CR>",
      desc = "Split window nicely",
    },
  },
  -- opts = {
  --   ui = {
  --     -- TODO: seems not working
  --     -- handled by tint.nvim for now
  --     winhighlight = false,
  --   },
  -- },
  config = function()
    require("focus").setup()

    local ignore_filetypes = {
      "neo-tree",
      "help",
      "alpha",
      "dashboard",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
    }
    local ignore_buftypes = { "nofile", "prompt", "popup" }

    local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

    vim.api.nvim_create_autocmd("WinEnter", {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
          vim.w.focus_disable = true
        else
          vim.w.focus_disable = false
        end
      end,
      desc = "Disable focus autoresize for BufType",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
          vim.b.focus_disable = true
        else
          vim.b.focus_disable = false
        end
      end,
      desc = "Disable focus autoresize for FileType",
    })
  end,
}
