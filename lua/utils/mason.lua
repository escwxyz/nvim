--- Check if mason registry has the given LSP server
---@param server string name of server
---@return boolean
local function is_mason_lsp_server(server)
  local all_servers = require("mason-lspconfig").get_available_servers()
  return vim.tbl_contains(all_servers, server)
end

--- Helper function to transform tables
---@param config table<string, FormatterConfig | LinterConfig>?
---@return table
local function transform(config)
  local result = {}
  if config and next(config) ~= nil then
    for formatter_linter, config_data in pairs(config) do
      if config_data.autoinstall then
        table.insert(result, formatter_linter)
      end
    end
  end
  return result
end

local function get_ensure_installed()
  -- lsp servers
  local language_servers = require("configs.langs").language_servers
  local lsp_servers = {}
  for server, server_config in pairs(language_servers) do
    if server_config.autoinstall and is_mason_lsp_server(server) then
      table.insert(lsp_servers, server)
    end
  end

  local filetypes = require("configs.langs").filetypes

  local linters = {}
  local formatters = {}

  for _, filetype_config in pairs(filetypes) do
    -- Formatters
    formatters = transform(filetype_config.formatters)
    -- Linters
    linters = transform(filetype_config.linters)
  end

  local unique_values = {}
  local ensure_installed = {}
  -- Helper function to insert a value into ensure_installed if it's not already present
  local function insert_unique(value)
    if not unique_values[value] then
      table.insert(ensure_installed, value)
      unique_values[value] = true
    end
  end

  -- Insert the values from lsp_servers, formatters, and linters into ensure_installed
  for _, value in ipairs(lsp_servers) do
    insert_unique(value)
  end

  for _, value in ipairs(formatters) do
    insert_unique(value)
  end

  for _, value in ipairs(linters) do
    insert_unique(value)
  end
end

return {
  ensure_installed = get_ensure_installed(),
}
