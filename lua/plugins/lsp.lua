return {
  -- null-ls
  --
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          require("typescript.extensions.null-ls.code-actions"),
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.rustfmt.with({
            extra_args = { "--edition=2021" },
          }),
          nls.builtins.formatting.dart_format,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.prettierd.with({
            extra_args = {
              "--no-semi",
              "--single-quote",
              "--jsx-single-quote",
              "--print-width 100",
            },
          }),
        },
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "prettierd",
      },
      ui = {
        border = "rounded",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ---@type lspconfig.options.tsserver
        tsserver = {
          settings = {
            typescript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            javascript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            if client.name == "tsserver" then
          -- stylua: ignore
          vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", { buffer = buffer, desc = "Organize Imports" })
          -- stylua: ignore
          vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- goto preview
  --
  {
    "rmagatti/goto-preview",
    keys = {
      {
        "gpd",
        function()
          require("goto-preview").goto_preview_definition({})
        end,
        desc = "Goto preview definition",
      },
      {
        "gpt",
        function()
          require("goto-preview").goto_preview_type_definition({})
        end,
        desc = "Goto preview type definition",
      },
      {
        "gpi",
        function()
          require("goto-preview").goto_preview_implementation({})
        end,
        desc = "Goto preview implementation",
      },
      {
        "gpq",
        function()
          require("goto-preview").close_all_win()
        end,
        desc = "Goto preview quit",
      },
      {
        "gpr",
        function()
          require("goto-preview").goto_preview_references()
        end,
        desc = "Goto preview references",
      },
    },

    opts = {
      opacity = 80,
      dismiss_on_move = true,
      references = {
        telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
      },
    },
  },

  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "plugins.extras.lang.typescript" },

  { import = "plugins.extras.lang.rust" },
}
