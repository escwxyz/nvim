local Constants = require("configs.constants")
local LspUtils = require("utils.lsp")

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim", opts = {}, ft = { "lua" } },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- Diagnostics
    LspUtils.define_diagnostics()
    --
    -- hover/signature help
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = Constants.borders })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = Constants.borders })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local buffer = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client then
          LspUtils.on_attach(client, buffer)
        end
      end,
    })

    local mason = require("mason")
    local lspconfig = require("lspconfig")
    local mlsp = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        border = "rounded",
      },
    })

    mlsp.setup()

    mason_tool_installer.setup({
      ensure_installed = require("utils.mason").get_ensure_installed(),
      auto_update = true,
    })

    local server_handlers = {}

    local language_servers = require("configs.langs").language_servers

    for server, server_config in pairs(language_servers) do
      local settings = server_config.settings or {}
      if server_config.config_by_mason then
        if server == "lua_ls" then
          -- TODO: check out neodev config
          require("neodev").setup()
        end

        server_handlers[server] = function()
          lspconfig[server].setup({
            capabilities = LspUtils.make_capabilities(),
            settings = settings,
          })
        end
      end
    end

    mlsp.setup_handlers(server_handlers)
  end,
}
