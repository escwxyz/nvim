return {
    "ThePrimeagen/refactoring.nvim",
    ft = { "typescript", "javascript", "lua" },
    config = function()
      require("refactoring").setup({
        prompt_func_return_type = {
          typescript = true,
          javascript = true,
        },
        prompt_func_param_type = {
          typescript = true,
          javascript = true,
        },
      })
      -- TODO:
      -- require("telescope").load_extension("refactoring")
      -- vim.keymap.set("v", "<leader>r", require("telescope").extensions.refactoring.refactors, { desc = "Refactoring" })
    end,
  }
  