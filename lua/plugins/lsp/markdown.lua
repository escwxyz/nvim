return {
  "MeanderingProgrammer/markdown.nvim",
  ft = { "markdown", "norg", "rmd", "org" },
  opts = {
    file_types = { "markdown", "norg", "rmd", "org" },
    code = {
      sign = false,
      width = "block",
      right_pad = 1,
    },
    heading = {
      sign = false,
      icons = {},
    },
  },
  config = function(_, opts)
    local markdown = require("render-markdown")
    markdown.setup(opts)
    vim.keymap.set("n", "<leader>m", function()
      local if_rendered = require("render-markdown.state").enabled
      if if_rendered then
        markdown.disable()
      else
        markdown.enable()
      end
    end, { desc = "Toggle Render Markdown" })
  end,
}
