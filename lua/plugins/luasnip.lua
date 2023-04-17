return {
    "L3MON4D3/LuaSnip",
    config = function()
        require("luasnip").config.set_config({
            history = false,
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
            -- Event on which to check for exiting a snippet's region
            region_check_events = "InsertEnter",
            delete_check_events = "InsertLeave",
        })
        -- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#extra
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = vim.fn.stdpath("config") .. "/snippets",
        })
    end,
}
