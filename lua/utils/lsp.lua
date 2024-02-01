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

local function is_diag_for_cur_pos()
  local diagnostics = vim.diagnostic.get(0)
  local pos = vim.api.nvim_win_get_cursor(0)
  if #diagnostics == 0 then
    return false
  end
  local message = vim.tbl_filter(function(d)
    return d.col == pos[2] and d.lnum == pos[1] - 1
  end, diagnostics)
  return #message > 0
end

--- Hover for different file types and folds
--- credit goes to https://github.com/catgoose/nvim
---
local function handle_hover()
  -- NOTE: cusor must be exactly on the function signature
  local win_id = require("ufo").peekFoldedLinesUnderCursor()
  if win_id then -- if there is fold
    return
  end

  local ft = vim.bo.filetype
  -- for different file types
  if vim.tbl_contains({ "vim", "help" }, ft) then
    vim.cmd("silent! h " .. vim.fn.expand("<cword>"))
  elseif vim.tbl_contains({ "man" }, ft) then
    vim.cmd("silent! Man " .. vim.fn.expand("<cword>"))
  elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
    -- TODO: support for package.json
    require("crates").show_popup()
  elseif is_diag_for_cur_pos() then
    vim.diagnostic.open_float()
  else
    vim.lsp.buf.hover()
  end
end

--- Set keymaps once lsp server attached to a buffer
---@param client lsp.Client
---@param bufnr integer
local function on_attach(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  local methods = vim.lsp.protocol.Methods

  if client.supports_method(methods.textDocument_codeAction) then
    map({ "n", "v" }, "<leader>ca", function()
      -- require("fzf-lua").lsp_code_actions({
      --   win_opts = {
      --     width = 0.6,
      --     height = 0.6,
      --     row = 1,
      --     preview = { vertical = "up:70%" },
      --   },
      -- })
      vim.lsp.buf.code_action()
    end, { desc = "Code actions", buffer = bufnr })
  end

  if client.supports_method(methods.textDocument_hover) then
    map({ "n", "v" }, "K", handle_hover, { desc = "Hover", buffer = bufnr })
  end

  --       --     vim.keymap.set("n", "rr", function()
  --       --         if client.server_capabilities.renameProvider ~= nil then
  --       --             return "<cmd>:IncRename " .. vim.fn.expand("<cword>") .. "<CR>"
  --       --         else
  --       --             vim.lsp.buf.rename()
  --       --         end
  --       --     end, { silent = true, buffer = bufnr })

  -- TODO: diagnostics / trouble
end

local function make_capabilities()
  local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

  local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    has_cmp and cmp_nvim_lsp.default_capabilities() or {},
    {
      workspace = {
        -- PERF: didChangeWatchedFiles is too slow.
        -- TODO: Remove this when https://github.com/neovim/neovim/issues/23291#issuecomment-1686709265 is fixed.
        didChangeWatchedFiles = { dynamicRegistration = false },
      },
    }
  )

  -- for ufo
  -- see https://github.com/kevinhwang91/nvim-ufo
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  return capabilities
end

local function define_diagnostics()
  vim.diagnostic.config({
    update_in_insert = true,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  })

  local icons = require("configs.icons").diagnostics

  for type, icon in pairs(icons) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

--- Check if mason registry has the given server
---@param server string name of server
---@return boolean
local function is_mason_server(server)
  local all_servers = require("mason-lspconfig").get_available_servers()
  return vim.tbl_contains(all_servers, server)
end

local M = {
  on_attach = on_attach,
  make_capabilities = make_capabilities,
  get_server_settings = get_server_settings,
  define_diagnostics = define_diagnostics,
  is_mason_server = is_mason_server,
}

return M
