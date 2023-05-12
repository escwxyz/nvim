return {
  -- nvim treesitter
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "dart",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "query",
        "regex",
        "rust",
        "solidity",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = false,
          node_decremental = "<BS>",
        },
      },
    },
  },
  -- ts autotag
  --
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "astro",
      "typescript",
      "html",
      "javascript",
      "javascriptreact",
      "typescriptreact",
      "tsx",
      "jsx",
      "markdown",
    },
    config = true,
  },
  -- ts node action
  --
  {
    "ckolkey/ts-node-action",
    dependencies = { "nvim-treesitter" },
    keys = {
      {
        "<leader>cn",
        function()
          require("ts-node-action").node_action()
        end,
        desc = "Node action",
      },
    },
  },
}
