local function set_keymaps()
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
end

local function get_formatters_by_ft()
  local filetypes = require("configs.langs").filetypes

  local formatters_by_ft = {}

  for ft, config in pairs(filetypes) do
    local formatters = config.formatters
    if formatters and next(formatters) ~= nil then -- Check if formatters table is not empty
      local formatter_list = {}
      for formatter, _ in pairs(formatters) do
        table.insert(formatter_list, formatter)
      end
      formatters_by_ft[ft] = formatter_list
    end
  end
  return formatters_by_ft
end

local function get_custom_formatters()
  local filetypes = require("configs.langs").filetypes

  local formatters = {}

  for _, config in pairs(filetypes) do
    local formatter_config = config.formatters
    if formatter_config and next(formatter_config) ~= nil then
      for formatter, formatter_data in pairs(formatter_config) do
        local prepend_args = formatter_data.prepend_args
        if prepend_args then
          if type(prepend_args) == "table" or type(prepend_args) == "string" then
            formatters[formatter] = { prepend_args = prepend_args }
          elseif type(prepend_args) == "function" then
            ---@diagnostic disable-next-line: undefined-global
            local resolved_prepend_args = prepend_args(self, context)
            if resolved_prepend_args then
              formatters[formatter] = { prepend_args = resolved_prepend_args }
            end
          end
        end
      end
    end
  end
  return formatters
end

return {
  set_keymaps = set_keymaps,
  get_formatters_by_ft = get_formatters_by_ft,
  get_custom_formatters = get_custom_formatters,
}
