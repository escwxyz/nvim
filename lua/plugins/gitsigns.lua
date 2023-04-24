local icons = require("config.icons").gitsigns

return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { hl = "GitSignsAdd", text = icons.add, numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = {
        hl = "GitSignsChange",
        text = icons.change,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delete = {
        hl = "GitSignsDelete",
        text = icons.delete,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = icons.topdelete,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        hl = "GitSignsChange",
        text = icons.changedelete,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      untracked = { hl = "GitSignsAdd", text = icons.untracked, numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    },
    on_attach = function(bufnr)
      local hydra = require("hydras.gitsigns_hydra").init_hydra(bufnr)
      vim.keymap.set("n", "<leader>G", function()
        hydra:activate()
      end, { desc = "Gitsigns" })
    end,
  },
}
