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
      show_success_message = true,
    })
    -- TODO: keymaps
  end,
}

