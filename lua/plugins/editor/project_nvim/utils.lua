local M = {}

local Utils = require("utils")

local has_fzf_lua, fzf_lua = Utils.has_plugin("fzf-lua")

if not has_fzf_lua then
  Utils.error("Fzf-lua is not installed")
  return M
end

function M.find_recent_projects()
  local contents = require("project_nvim").get_recent_projects()

  local reverse = {}

  for i = #contents, 1, -1 do
    reverse[#reverse + 1] = contents[i]
  end

  fzf_lua.fzf_exec(reverse, {
    prompt = "Projects:",
    actions = {
      ["default"] = function(e)
        vim.cmd.cd(e[1])
        vim.cmd(":enew") -- open an empty buffer
      end,
      ["ctrl-d"] = function(x)
        local choice = vim.fn.confirm("Delete '" .. #x .. "' projects? ", "&Yes\n&No", 2)
        if choice == 1 then
          local history = require("project_nvim.utils.history")
          for _, v in ipairs(x) do
            history.delete_project(v)
          end
        end
      end,
    },
  })
end

return M
