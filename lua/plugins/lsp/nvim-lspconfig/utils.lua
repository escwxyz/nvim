local icons = require("configs.icons").diagnostics
local map = require("utils").map

--- Fetch server settings by its name
---@param server string
---@return table
local function get_server_settings(server)
  local has_setting, setting = pcall(require, "plugins.lsp.nvim-lspconfig.servers." .. server)
  if not has_setting then
    return {}
  end
  return setting
end

local function define_diagnostics()
  vim.diagnostic.config({
    update_in_insert = true,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  })

  for type, icon in pairs(icons) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

-- local function on_attach(callback)
--   vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(args)
--       local buffer = args.buf
--       local client = vim.lsp.get_client_by_id(args.data.client_id)
--       callback(client, buffer)
--     end,
--   })
-- end

local function on_attach()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      map("n", "K", vim.lsp.buf.hover, { desc = "[LSP] Hover", buffer = buffer })
      map("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", { desc = "[Fzf] Goto definitions" })
      map("n", "gr", "<cmd>FzfLua lsp_references<CR>", { desc = "[Fzf] Goto references" })
      map("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", { desc = "[Fzf] Goto declarations" })
      map("n", "gI", "<cmd>FzfLua lsp_implementations<CR>", { desc = "[Fzf] Goto implementations" })
      map("n", "gT", "<cmd>FzfLua lsp_typedefs<CR>", { desc = "[Fzf] Goto typedefs" })
      --
      -- TODO: handled by trouble
      --
      -- map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", buffer = buffer })
      -- map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic", buffer = buffer })
      --     -- if client.server_capabilities.documentSymbolProvider then
      --     --     navic.attach(client, bufnr)
      --     -- end

      --     vim.keymap.set("n", "rr", function()
      --         if client.server_capabilities.renameProvider ~= nil then
      --             return "<cmd>:IncRename " .. vim.fn.expand("<cword>") .. "<CR>"
      --         else
      --             vim.lsp.buf.rename()
      --         end
      --     end, { silent = true, buffer = bufnr })
    end,
  })
end

local function map_keys(_, buffer)
  map("n", "K", vim.lsp.buf.hover, { desc = "[LSP] Hover", buffer = buffer })
  map("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", { desc = "[Fzf] Goto definitions" })
  map("n", "gr", "<cmd>FzfLua lsp_references<CR>", { desc = "[Fzf] Goto references" })
  map("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", { desc = "[Fzf] Goto declarations" })
  map("n", "gI", "<cmd>FzfLua lsp_implementations<CR>", { desc = "[Fzf] Goto implementations" })
  map("n", "gT", "<cmd>FzfLua lsp_typedefs<CR>", { desc = "[Fzf] Goto typedefs" })
  -- TODO: handled by trouble
  map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", buffer = buffer })
  map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic", buffer = buffer })
  --     -- if client.server_capabilities.documentSymbolProvider then
  --     --     navic.attach(client, bufnr)
  --     -- end

  --     vim.keymap.set("n", "rr", function()
  --         if client.server_capabilities.renameProvider ~= nil then
  --             return "<cmd>:IncRename " .. vim.fn.expand("<cword>") .. "<CR>"
  --         else
  --             vim.lsp.buf.rename()
  --         end
  --     end, { silent = true, buffer = bufnr })
end

local function make_capabilities()
  local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

  local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    has_cmp and cmp_nvim_lsp.default_capabilities() or {}
  )

  -- for ufo
  -- see https://github.com/kevinhwang91/nvim-ufo
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  return capabilities
end

--- Check if mason registry has the given server
---@param server string
---@return boolean
local function is_mason_server(server)
  local all_servers = require("mason-lspconfig").get_available_servers()
  return vim.tbl_contains(all_servers, server)
end

local M = {
  define_diagnostics = define_diagnostics,
  make_capabilities = make_capabilities,
  on_attach = on_attach,
  map_keys = map_keys,
  is_mason_server = is_mason_server,
  get_server_settings = get_server_settings,
}

return M
