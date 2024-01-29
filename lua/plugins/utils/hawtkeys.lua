-- TODO: not working `invalid key footer_pos`
-- see https://github.com/tris203/hawtkeys.nvim/blob/main/lua/hawtkeys/ui.lua#L36-L38
--
return {
  "tris203/hawtkeys.nvim",
  enabled = false, -- temporary
  cmd = {
    "Hawtkeys",
    "HawtkeysAll",
    "HawtkeysDupes",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    customMaps = {
      ["lazy"] = {
        method = "lazy",
      },
    },
  },
}
