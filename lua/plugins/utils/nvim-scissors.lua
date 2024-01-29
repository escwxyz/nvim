return {
  "chrisgrieser/nvim-scissors",
  keys = {
    {
      mode = { "x", "n" },
      "<leader>sa",
      function()
        require("scissors").addNewSnippet()
      end,
      desc = "Add new snippet",
    },
    {
      "<leader>se",
      function()
        require("scissors").editSnippet()
      end,
      desc = "Edit snippet",
    },
  },
  opts = {
    snippetDir = vim.fn.stdpath("config") .. "/snippets",
    editSnippetPopup = {
      keymaps = {
        jumpBetweenBodyAndPrefix = "<C-Tab>",
        saveChanges = "<CR>",
      },
    },
    jsonFormatter = "jq",
  },
}
