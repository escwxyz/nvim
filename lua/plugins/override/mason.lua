-- TODO: this shouldn't be loaded unless we open it
return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  opts = function(_, opts)
    table.insert(opts.ensure_installed, "prettierd")
  end,
}
