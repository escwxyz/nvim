local Time = require("plugins.ui.heirline.components.statusline.time")
local StartupTime = require("plugins.ui.heirline.components.statusline.startup_time")
local ViMode = require("plugins.ui.heirline.components.statusline.vi_mode")
local GitStatus = require("plugins.ui.heirline.components.statusline.git")
local Lazy = require("plugins.ui.heirline.components.statusline.lazy")
-- local WorkSpace = require("plugins.heirline.components.shared.workspace")
local Align = require("plugins.ui.heirline.components.shared.align")
local Space = require("plugins.ui.heirline.components.shared.space")

return {
  condition = function()
    return not vim.g.ZenMode
  end,
  hl = "Normal", -- I want the statusline to be transparent
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
    StartupTime,
    Time,
  },
}
