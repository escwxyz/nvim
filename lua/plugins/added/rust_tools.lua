return {

  "simrat39/rust-tools.nvim",
  ft = "rust",
  config = function()
    local rt = require("rust-tools")
    rt.setup({
      server = {
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
          -- Code action groups
          vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })

          vim.keymap.set("n", "<leader>is", "<cmd>RustSetInlayHints<CR>", { desc = "Set InlayHints" })
          vim.keymap.set("n", "<leader>iu", "<cmd>RustUnsetInlayHints<CR>", { desc = "Unset InlayHints" })
        end,
      },
    })
  end,
}
