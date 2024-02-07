return {
  "dgagn/diagflow.nvim",
  event = "LspAttach",
  opts = {
    enable = function()
      return vim.bo.filetype ~= "lazy"
    end,
    max_height = 20,
    show_borders = true,
  },
}
