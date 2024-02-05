-- A list of servers to be configured either via third-party plugins or mason-lspconfig / nvim-lspconfig
-- `mason`: if configured by mason-lspconfig
-- `autoinstall`: if autoinstalled by mason
-- TODO: take formatters into consideration for `ensure_installed`
return {
  ["lua_ls"] = {
    autoinstall = true,
    mason = true,
  },
  ["rust_analyzer"] = {
    autoinstall = true,
    mason = false,
  },
  ["bashls"] = {
    autoinstall = true,
    mason = true,
  },
}
