return {
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cn",
        false,
      },
      {
        "<leader>n",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Annotations (Neogen)",
      },
    },
  },
  {
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
          cancel = "q",
          saveChanges = "<CR>", -- alternatively, can also use `:w`
          goBackToSearch = "<BS>",
          deleteSnippet = "<C-BS>",
          duplicateSnippet = "<C-d>",
          openInFile = "<C-o>",
          insertNextPlaceholder = "<C-p>", -- insert & normal mode
        },
      },
      jsonFormatter = "jq",
    },
  },
}
