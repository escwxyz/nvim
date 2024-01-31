local function has_words_before()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function format(entry, vim_item)
  -- support tailwindcss
  if vim_item.kind == "Color" and entry.completion_item.documentation then
    local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
    if r then
      local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
      local group = "Tw_" .. color
      if vim.fn.hlID(group) < 1 then
        vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
      end
      vim_item.kind = "●"
      vim_item.kind_hl_group = group
      return vim_item
    end
  end
  -- -- temp fix
  -- if vim_item.kind == "TabNine" then
  --   vim_item.kind = "Copilot"
  --   vim_item.kind_hl_group = "String"
  -- end
  local icons = require("configs.icons").kinds

  if icons[vim_item.kind] then
    vim_item.kind = icons[vim_item.kind] .. vim_item.kind
  end
  return vim_item
end

local function is_not_comment()
  local context = require("cmp.config.context")
  return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
end

local function is_not_buftype()
  local bt = vim.bo.buftype
  local exclude_bt = {
    -- TODO:
    "prompt",
    "nofile",
    "terminal",
  }
  for _, v in pairs(exclude_bt) do
    if bt == v then
      return false
    end
  end
  return true
end

local function is_not_filetype()
  local ft = vim.bo.filetype
  local exclude_ft = {
    -- TODO:
    "neo-tree",
    "neo-tree-popup",
    "oil",
  }
  for _, v in pairs(exclude_ft) do
    if ft == v then
      return false
    end
  end
  return true
end

local function is_enabled()
  return is_not_comment() and is_not_buftype() and is_not_filetype()
end

local M = {
  is_enabled = is_enabled,
  has_words_before = has_words_before,
  format = format,
}

return M
