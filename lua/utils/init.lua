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
---@param plugin_name string
---@return boolean
local function has_plugin(plugin_name)
  return pcall(require, plugin_name)
end

--- Check if a plugin is loaded
local function is_plugin_loaded(plugin)
  return require("lazy.core.config").plugins[plugin]._.loaded
end

local M = {
  map = map,
  get_plugins = get_plugins,
  has_plugin = has_plugin,
  alpha = require("utils.neovide").alpha,
  change_transparency = require("utils.neovide").change_transparency,
  is_plugin_loaded = is_plugin_loaded,
}

return M
