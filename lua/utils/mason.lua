--- Check if mason registry has the given LSP server
---@param server string name of server
---@return boolean
local function is_mason_lsp_server(server)
  local all_servers = require("mason-lspconfig").get_available_servers()
  return vim.tbl_contains(all_servers, server)
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

  local formatters = {}
  local linters = {}

  for _, filetype_config in pairs(filetypes) do
    -- Formatters
    local formatters_config = filetype_config.formatters
    if formatters_config and next(formatters_config) ~= nil then
      for formatter, formatter_data in pairs(formatters_config) do
        if formatter_data.autoinstall then
          table.insert(formatters, formatter)
        end
      end
    end

    -- Linters
    local linters_config = filetype_config.linters
    if linters_config and next(linters_config) ~= nil then
      for linter, linter_data in pairs(linters_config) do
        if linter_data.autoinstall then
          table.insert(linters, linter)
        end
      end
    end
  end

  -- Deduplicate the values in ensure_installed
  local ensure_installed = {}
  local unique_values = {}

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

  return ensure_installed
end

return {
  get_ensure_installed = get_ensure_installed,
}
