return {
  "folke/zen-mode.nvim",
  keys = { { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle ZenMode" } },
  config = function()
    require("zen-mode").setup({
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        width = 120, -- width of the Zen window
        height = 1, -- height of the Zen window
        options = {
          cursorline = false,
          cursorcolumn = false,
          -- signcolumn = "no", -- disable signcolumn
          -- foldcolumn = "0", -- disable fold column
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
        },
        -- TODO: not working
        gitsigns = { enabled = false }, -- disables git signs
      },
      on_open = function(_)
        vim.g.ZenMode = true
      end,
      on_close = function()
        vim.g.ZenMode = false
      end,
    })
  end,
}
