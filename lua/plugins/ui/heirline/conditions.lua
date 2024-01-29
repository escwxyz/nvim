-- Extend the builtin conditions
local M = require("heirline.conditions")

local get_option = vim.api.nvim_get_option_value

--- Check if the buffer is modified
---@param bufnr number
---@return boolean
function M.is_buffer_modified(bufnr)
  return get_option("modified", { bufnr = bufnr })
end

--- Check if the buffer is readonly
---@param bufnr number
---@return boolean
function M.is_buffer_readonly(bufnr)
  return get_option("readonly", { bufnr = bufnr })
end

--- Check if the buffer is a terminal
---@param bufnr number
---@return boolean
function M.is_terminal(bufnr)
  return get_option("buftype", { bufnr = bufnr }) == "terminal"
end

return M
