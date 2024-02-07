return {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  ft = { "rust" },
  dependencies = {
    {
      "saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      config = true,
    },
  },
  config = function()
    vim.g.rustaceanvim = {
      tools = {},
      server = {
        on_attach = function(client, bufnr)
          require("utils.lsp").on_attach(client, bufnr)
          vim.keymap.del("n", "<leader>ca", { buffer = bufnr })
          local map = require("utils").map

          map("n", "<leader>ca", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "[RS] Code action", buffer = bufnr, silent = true })
        end,
        settings = {
          ["rust-analyzer"] = require("configs.langs").language_servers.rust_analyzer.settings,
        },
      },
      dap = {},
    }
  end,
}
