return {
    "m-demare/hlargs.nvim",
    enabled = true,
    event = "CursorMoved",
    config = function()
        require("plugins.hlargs.config").setup()
    end,
}
