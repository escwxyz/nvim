return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  -- init = function(plugin)
  --   -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
  --   -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
  --   -- no longer trigger the **nvim-treeitter** module to be loaded in time.
  --   -- Luckily, the only thins that those plugins need are the custom queries, which we make available
  --   -- during startup.
  --   require("lazy.core.loader").add_to_rtp(plugin)
  --   require("nvim-treesitter.query_predicates")
  -- end,
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  config = function()
    require("nvim-treesitter.configs").setup({
      modules = {},
      sync_install = false,
      auto_install = false,

      ignore_install = {},
      ensure_installed = "all",
      -- highlight module
      highlight = {
        enable = true,
        disable = function(_, buf)
          -- disable highlight for large file
          local max_filesize = 1000 * 1024 -- 1000 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },

      -- indentation module
      indent = { enable = true },

      -- incremental selection module
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = false,
          scope_incremental = "<CR>",
          node_decremental = "<BS>",
        },
      },

      -- text objects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },
          include_surrounding_whitespace = true,
        },

        move = {
          -- TODO: temp disabled for testing
          enable = false,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },

        lsp_interop = {
          -- TODO: temp disabled
          enable = false,
        },
      },
    })
  end,
}
