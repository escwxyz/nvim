return {
    "anuvyklack/hydra.nvim",
    enabled = true,
    event = "BufEnter",
    config = function()
        local command = vim.api.nvim_create_user_command

        command("HydraEditorOptions", function()
            require("hydras.options-hydra").activate()
        end, {})
        command("HydraUrlView", function()
            require("hydras.urlview-hydra").activate()
        end, {})
    end,
}
