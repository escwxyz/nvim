--@type LazyPluginSpec[]
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "all",
      -- incremental selection module
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
    opts = {},
  },
}
