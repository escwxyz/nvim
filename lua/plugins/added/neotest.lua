return {
  "nvim-neotest/neotest",
  keys = {
    {
      "<leader>tt",
      function()
        require("neotest").run.run()
      end,
      desc = "[Test] Run nearst",
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "[Test] Run file",
    },
    {
      "<leader>ts",
      function()
        require("neotest").run.stop()
      end,
      desc = "[Test] Stop",
    },
  },
  dependencies = {
    { "marilari88/neotest-vitest" },
    { "sidlatau/neotest-dart" },
    { "rouge8/neotest-rust" },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-vitest"),
        require("neotest-dart")({
          command = "flutter",
          use_lsp = true,
        }),
        require("neotest-rust"),
      },
    })
  end,
}
