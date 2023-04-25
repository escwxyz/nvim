return {
  "nvim-treesitter/nvim-treesitter",
  keys = {
    { "<CR>", desc = "Increment selection" },
    { "<BS>", desc = "Decrement selection", mode = "x" },
  },
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
}
