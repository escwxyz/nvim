local Time = require("plugins.ui.heirline.components.statusline.time")
local ViMode = require("plugins.ui.heirline.components.statusline.vi_mode")
local GitStatus = require("plugins.ui.heirline.components.statusline.git")
local Lazy = require("plugins.ui.heirline.components.statusline.lazy")
-- local WorkSpace = require("plugins.heirline.components.shared.workspace")
local Align = require("plugins.ui.heirline.components.shared.align")
local Space = require("plugins.ui.heirline.components.shared.space")

return {
  -- condition = function()
  --   return vim.g.ZenMode == true
  -- end,
  fallthrough = false,
  -- {
  --     condition = function()
  --         return require("hydra.statusline").get_hint() ~= nil
  --     end,
  --     Align,
  --     Hydra,
  --     Align,
  -- },
  {
    ViMode,
    -- Space,
    -- WorkSpace,
    GitStatus,
    Align,
    Lazy,
    Space,
    Time,
  },
}
