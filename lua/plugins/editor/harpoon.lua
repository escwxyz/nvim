return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local harpoon = require("harpoon")
    return {
      {
        "<leader>h",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "[Harpoon] Quick menu",
      },
      {
        "<leader>a",
        function()
          harpoon:list():append()
        end,
        desc = "[Harpoon] Append mark",
      },
      {
        "<leader>1",
        function()
          harpoon:list():select(1)
        end,
        desc = "[Harpoon] Go to mark 1",
      },
      {
        "<leader>2",
        function()
          harpoon:list():select(2)
        end,
        desc = "[Harpoon] Go to mark 2",
      },
      {
        "<leader>3",
        function()
          harpoon:list():select(3)
        end,
        desc = "[Harpoon] Go to mark 3",
      },
      {
        "<leader>]",
        function()
          harpoon:list():next()
        end,
        desc = "[Harpoon] Next mark",
      },
      {
        "<leader>[",
        function()
          harpoon:list():prev()
        end,
        desc = "[Harpoon] Prev mark",
      },
    }
  end,
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    -- TODO: check more here
    -- see: https://github.com/ThePrimeagen/harpoon/tree/harpoon2
  end,
}
