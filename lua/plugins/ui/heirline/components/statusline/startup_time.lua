-- TODO: the highlight still behaves differently on neovide and terminals
--
local conditions = require("plugins.ui.heirline.conditions")
local get_highlight = require("heirline.utils").get_highlight

local StartupTime = {
  condition = function()
    return not conditions.is_dashboard()
  end,

  {
    provider = " ",
    hl = {
      fg = get_highlight("WildMenu").bg,
      bg = get_highlight("Normal").bg,
    },
  },
  {
    init = function(self)
      local stats = require("lazy").stats()
      self.startuptime = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    end,
    provider = function(self)
      return " " .. self.startuptime .. " ms"
    end,
    hl = {
      fg = get_highlight("StatusLine").fg,
      bg = get_highlight("WildMenu").bg,
    },
    {

      provider = " ",
      hl = {
        fg = get_highlight("WildMenu").bg,
        bg = get_highlight("Normal").bg,
      },
    },
  },
}

return StartupTime
