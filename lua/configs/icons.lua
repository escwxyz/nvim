-- TODO: add more icons

local M = {}

M.kinds = {
  Array = " ",
  Boolean = " ",
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Copilot = " ",
  Codeium = " ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = " ",
  Key = " ",
  Keyword = " ",
  Method = " ",
  Module = " ",
  Namespace = " ",
  Null = " ",
  Number = " ",
  Object = " ",
  Operator = " ",
  Package = " ",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  String = " ",
  Struct = " ",
  Text = " ",
  TypeParameter = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

M.diagnostics = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

M.buftypes = {
  Terminal = "  ",
}

M.dap = {
  Stopped = { " ", "DiagnosticWarn", "DapStoppedLine" },
  Breakpoint = " ",
  BreakpointCondition = " ",
  BreakpointRejected = { " ", "DiagnosticError" },
  LogPoint = ".>",
}

M.log_levels = {
  DEBUG = "",
  ERROR = "",
  INFO = "",
  TRACE = "✎",
  WARN = "",
}

M.git_status = {
  added = "█",
  modified = "░",
  deleted = "▶",
  renamed = "◌",
  -- TODO:
  untracked = "▎",
  ignored = " ",
  unstaged = "󰄱",
  staged = "",
  conflict = "",
}

return M
