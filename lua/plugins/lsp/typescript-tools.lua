return {
  "pmizio/typescript-tools.nvim",
  ft = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("typescript-tools").setup({
      on_attach = function()
        -- TODO: mini clue support
        ---@diagnostic disable-next-line: param-type-mismatch
        -- require("utils.lsp").on_attach(_, 0)
        local map = require("utils").map
        map("n", "<leader>ctr", "<cmd>TSToolsRenameFile<CR>", { desc = "[TS] Rename file" })
        map("n", "<leader>cto", "<cmd>TSToolsOrganizeImports<CR>", { desc = "[TS] Organize imports" })
      end,
      settings = require("configs.langs").language_servers.tsserver.settings,
    })
  end,
}
