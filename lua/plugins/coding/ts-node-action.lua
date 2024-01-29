return {
  "ckolkey/ts-node-action",
  dependencies = { "nvim-treesitter" },
  keys = {
    {
      "<leader>cn",
      function()
        require("ts-node-action").node_action()
      end,
      desc = "Node action",
    },
  },
}
