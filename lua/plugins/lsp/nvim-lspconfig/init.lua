local LspUtils = require("plugins.lsp.nvim-lspconfig.utils")
local Constants = require("configs.constants")
local ServerList = require("plugins.lsp.nvim-lspconfig.server-list")

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim", opts = {} },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Diagnostics
    LspUtils.define_diagnostics()
    -- hover/signature help
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = Constants.borders })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = Constants.borders })

    local mason = require("mason")
    local lspconfig = require("lspconfig")
    local mlsp = require("mason-lspconfig")

    mason.setup({
        ui = {
            border = "rounded",
          },
    })

    local servers_to_install = {}
    local server_handlers = {}

    for server, value in pairs(ServerList) do
      -- if the server is available on mason registry
      if LspUtils.is_mason_server(server) then
        if value.autoinstall then
          -- autoinstall it via mason
          table.insert(servers_to_install, server)
        end
      end

      local settings = LspUtils.get_server_settings(server)

      if value.mason then
        -- auto config via mason-lspconfig
        if server == "lua_ls" then
          require("neodev").setup()
        end

        server_handlers[server] = function()
          lspconfig[server].setup({
            capabilities = LspUtils.make_capabilities(),
            on_attach = LspUtils.on_attach,
            settings = settings,
          })
        end
        -- else
        --   -- if not configured by mason-lspconfig
        --   require("plugins.neovim.nvim-lspconfig.servers." .. server)
      end
    end

    mlsp.setup({
      -- not use `vim.tbl_filter` to directly get table and then get its keys
      -- see: https://github.com/neovim/neovim/issues/13806
      ensure_installed = servers_to_install,
      handlers = server_handlers,
    })
  end,
}
