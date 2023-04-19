return {
    "folke/which-key.nvim",
    enabled = true,
    event = "VeryLazy",
    config = function()
        require("plugins.which_key.config").setup()
    end,
}
