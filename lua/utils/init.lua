local M = {}

function M.get_pluginlist(dir)
  local plugins = {}
  local config_path = vim.fn.stdpath("config")
  local plugins_dir = config_path .. "/lua/plugins/" .. dir

  local ok, err = pcall(vim.loop.fs_stat, plugins_dir)
  if not ok then
    print(err)
    return {}
  end

  for file in vim.fs.dir(plugins_dir) do
    local mod_name = file:match("^(.*)%.lua$")
    if mod_name and mod_name ~= "init" then
      table.insert(plugins, require("plugins." .. dir .. "." .. mod_name))
    end
  end

  return plugins
end

-- as global borders
M.borders = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

return M
