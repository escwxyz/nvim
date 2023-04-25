return {
  "L3MON4D3/LuaSnip",
  build = (not jit.os:find("Windows"))
      and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
    or nil,
  config = function()
    require("luasnip").config.set_config({
      history = false,
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
      -- Event on which to check for exiting a snippet's region
      region_check_events = "InsertEnter",
      delete_check_events = "InsertLeave",
      -- delete_check_events = "TextChanged",
    })
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = vim.fn.stdpath("config") .. "/snippets",
    })
  end,
}
