return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = { "typescript", "javascript", "lua", "typescriptreact", "javascriptreact" },
  keys = {
    {
      "<leader>r",
      function()
        require("refactoring").select_refactor({
          show_success_message = true,
        })
      end,
      mode = { "n", "x" },
      desc = "[Refactor] Select Refactor",
    },
  },
  config = function()
    require("refactoring").setup({
      show_success_message = true,
    })
  end,
}
