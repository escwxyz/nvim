local utils = require("heirline.utils")

local conditions = require("plugins.ui.heirline.conditions")

local icons = require("configs.icons")

local get_option_value = vim.api.nvim_get_option_value

local FileName = {
  provider = function(self)
    local filename = self.filename -- from the parent
    filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
    -- TODO limit the length
    return filename
  end,
  hl = function(self)
    return { bold = self.is_active or self.is_visible, italic = self.is_active }
  end,
}

local FileFlags = {
  {
    condition = function(self)
      return conditions.is_buffer_modified(self.bufnr)
    end,
    provider = " ● ",
  },
  {
    condition = function(self)
      return not get_option_value("modifiable", { buf = self.bufnr })
        or get_option_value("readonly", { buf = self.bufnr })
    end,
    provider = function(self)
      if conditions.is_terminal(self.bufnr) then
        return icons.buftypes.Terminal
      else
        return ""
      end
    end,
  },
}

local FileIcon = require("plugins.ui.heirline.components.shared.file_icon")
-- TODO
local BufferBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(self.bufnr)
  end,
  hl = function(self)
    return not self.is_active
        and {
          fg = utils.get_highlight("TabLineSel").fg,
          bg = utils.get_highlight("Normal").bg,
        }
      or "TabLine"
  end,
  {
    provider = "▎",
    hl = function(self)
      return not self.is_active
          and {
            fg = utils.get_highlight("Normal").bg,
            bg = utils.get_highlight("TabLine").bg,
          }
        or {
          fg = utils.get_highlight("TabLine").bg,
          bg = utils.get_highlight("TabLine").bg,
        }
    end,
  },
  FileIcon,
  FileName,
  FileFlags,
  {
    provider = "▎",
    hl = function(self)
      return not self.is_active
          and {
            fg = utils.get_highlight("Normal").bg,
            bg = utils.get_highlight("TabLine").bg,
          }
        or {
          fg = utils.get_highlight("TabLine").bg,
          bg = utils.get_highlight("TabLine").bg,
        }
    end,
  },
}
-- local TablinePicker = {
--     condition = function(self)
--         return self._show_picker
--     end,
--     init = function(self)
--         local bufname = vim.api.nvim_buf_get_name(self.bufnr)
--         bufname = vim.fn.fnamemodify(bufname, ":t")
--         local label = bufname:sub(1, 1)
--         local i = 2
--         while self._picker_labels[label] do
--             if i > #bufname then
--                 break
--             end
--             label = bufname:sub(i, i)
--             i = i + 1
--         end
--         self._picker_labels[label] = self.bufnr
--         self.label = label
--     end,
--     provider = function(self)
--         return self.label
--     end,
--     hl = { fg = "red", bold = true },
-- }
--
local BufferLine = utils.make_buflist(BufferBlock)

local M = {
  BufferLine = BufferLine,
  FileName = FileName,
}

return M
