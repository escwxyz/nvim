return {
    "stevearc/dressing.nvim",
    enabled = true,
    event = "VeryLazy",
    config = function()
        require("plugins.dressing.config").setup()
    end,
}
