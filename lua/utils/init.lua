local M = {}

local files_count_cache = {}

--- Check if it is a big project
---@param cwd? string current working directory
---@return boolean
M.in_big_project = function(cwd)
  ---@diagnostic disable-next-line: undefined-field
  cwd = cwd or vim.loop.cwd()

  -- Check cache first
  local count = files_count_cache[cwd]
  if count ~= nil then
    return count >= 1000
  end

  -- Run command to get file count
  local output = vim.fn.systemlist({
    "sh",
    "-c",
    "(git ls-files --cached || fd --type f) | wc -l",
  })

  -- Handle errors
  if #output > 1 then
    error("Error running command: " .. table.concat(output, "\n"))
  end

  count = tonumber(output[1])
  files_count_cache[cwd] = count

  return count >= 1000
end

return M
