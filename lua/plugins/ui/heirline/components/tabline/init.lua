local TablineOffset = require("plugins.ui.heirline.components.tabline.tablineoffset")
local BufferLine = require("plugins.ui.heirline.components.tabline.bufferline").BufferLine
local Tablist = require("plugins.ui.heirline.components.tabline.tablist")

local Align = require("plugins.ui.heirline.components.shared.align")

return {
  Tablist,
  Align,
  BufferLine,
  TablineOffset,
}
