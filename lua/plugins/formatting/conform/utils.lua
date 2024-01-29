local Utils = require("utils")

Utils.map("n", "<leader>tof", function()
  vim.g.disable_autoformat = vim.g.disable_autoformat == true and false or true
  vim.notify("Autoformat toggled " .. vim.g.disable_autoformat and "on" or "off.", "info", { title = "Conform" })
end, { desc = "Toggle autoformat globally" })

Utils.map("n", "<leader>toF", function()
  vim.b.disable_autoformat = vim.b.disable_autoformat == true and false or true
  vim.notify("Autoformat toggled " .. vim.b.disable_autoformat and "on" or "off.", "info", { title = "Conform" })
end, { desc = "Toggle autoformat locally" })

