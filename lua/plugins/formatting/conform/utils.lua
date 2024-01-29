local Utils = require("utils")

Utils.map("n", "<leader>tof", function()
  vim.g.disable_autoformat = vim.g.disable_autoformat == false and true or false
  local msg = string.format("Autoformat toggled %s globally.", vim.g.disable_autoformat and "off" or "on")
  vim.notify(msg, "info", { title = "Conform" })
end, { desc = "Toggle autoformat globally" })

Utils.map("n", "<leader>toF", function()
  vim.b.disable_autoformat = vim.b.disable_autoformat == false and true or false
  local msg = string.format("Autoformat toggled %s locally.", vim.b.disable_autoformat and "off" or "on")
  vim.notify(msg, "info", { title = "Conform" })
end, { desc = "Toggle autoformat locally" })
