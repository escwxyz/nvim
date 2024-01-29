local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local plugins = require("utils").get_plugins()

local opts = {
  defaults = {
    lazy = true,
    version = false,
  },
  install = { colorscheme = { "everforest" }, missing = true },
  checker = { enabled = true, frequency = 3600 * 24 },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "rounded",
  },
}

require("lazy").setup(plugins, opts)

vim.keymap.set("n", "<leader>\\", "<cmd>:Lazy<CR>", { desc = "Lazy Plugins" })
