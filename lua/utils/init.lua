local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local function get_plugins()
  local config_path = vim.fn.stdpath("config")
  local plugins_dir = config_path .. "/lua/plugins"
  -- @type LazySpec
  local plugins = {
    {
      "nvim-lua/plenary.nvim",
      lazy = false,
    },
  }

  for author_name in vim.fs.dir(plugins_dir) do
    local plugin_dir = plugins_dir .. "/" .. author_name
    for plugin_name in vim.fs.dir(plugin_dir) do
      local mod_name = plugin_name:match("^(.*)%.lua$")
      -- TODO: overlook filename starting with underscore
      if mod_name and mod_name ~= "init" then -- if it's lua file
        table.insert(plugins, require("plugins." .. author_name .. "." .. mod_name))
      else -- or if it's a folder
        for file in vim.fs.dir(plugin_dir .. "/" .. plugin_name) do
          mod_name = file:match("^(.*)%.lua$")
          if mod_name == "init" then
            table.insert(plugins, require("plugins." .. author_name .. "." .. plugin_name))
          end
        end
      end
    end
  end

  return plugins
end

--- Check if has the plugin with its name
---@param plugin_name string name of plugin
---@param title string? title for notify message
---@return table
local function has_plugin(plugin_name, title)
  local ok, plugin = pcall(require, plugin_name)
  if not ok then
    vim.notify(string.format("%s is not found.", plugin), "error", { title = title or nil })
  end
  return plugin
end

--- Check if plugin is loaded by Lazy
---@param plugin string full name of plugin
local function is_plugin_loaded(plugin)
  return require("lazy.core.config").plugins[plugin]._.loaded
end

-- for toggleterm
-- local function run_system_cmd(config)
--   if not config or not config.cmd then
--     return
--   end
--   config.notify_config = config.notify_config or { title = "System Command" }
--   vim.defer_fn(function()
--     local handle = io.popen(config.cmd)
--     if handle then
--       local result = handle:read("*a")
--       handle:close()
--       if config.notify == true then
--         require("notify").notify(result, vim.log.levels.INFO, config.notify_config)
--       end
--     end
--   end, 0)
-- end

local M = {
  map = map,
  get_plugins = get_plugins,
  has_plugin = has_plugin,
  is_plugin_loaded = is_plugin_loaded,
}

return M
