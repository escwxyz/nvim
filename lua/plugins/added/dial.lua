-- TODO: decrement not working!!!
return {
  "monaqa/dial.nvim",
  keys = {
    {
      "<c-]>",
      function()
        require("dial.map").manipulate("increment", "normal")
      end,
      desc = "Increment",
    },
    {
      "<c-[>",
      function()
        require("dial.map").manipulate("decrement", "normal")
      end,
      desc = "Decrement",
    },
    {
      "<c-]>",
      mode = "v",
      function()
        require("dial.map").manipulate("increment", "visual")
      end,
      desc = "Increment",
    },
    {
      "<c-[>",
      mode = "v",
      function()
        require("dial.map").manipulate("decrement", "visual")
      end,
      desc = "Decrement",
    },
  },

  -- TODO: check https://github.com/monaqa/dial.nvim/blob/master/doc/dial.txt#L200 to add more groups
  -- config = function()
  --   local augend = require("dial.augend")
  --   require("dial.config").augends:register_group({
  --     -- default augends used when no group name is specified
  --     default = {
  --       augend.integer.alias.decimal, -- nonnegative decimal number
  --       augend.integer.alias.hex, -- nonnegative hex number
  --       -- date (2022/02/19, etc.)
  --       augend.date.new({
  --         pattern = "%Y/%m/%d",
  --         default_kind = "day",
  --       }),
  --     },
  --   })
  -- end,
}
