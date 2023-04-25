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

M.has = function(plugin_name)
  return require("lazy.core.config").plugins[plugin_name] ~= nil
end

---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

---@param name string
function M.opts(name)
  local plugin = require("lazy.core.config").plugins[name]
  if not plugin then
    return {}
  end
  local Plugin = require("lazy.core.plugin")
  return Plugin.values(plugin, "opts", false)
end

return M
