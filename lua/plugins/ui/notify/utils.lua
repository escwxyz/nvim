local function find_notifications()
  -- local notifications = require("notify").history()
  --
  -- local reverse = {}
  --
  -- for i = #notifications, 1, -1 do
  --   reverse[#reverse + 1] = notifications[i]
  -- end
  --
  -- require("fzf-lua").fzf_exec(reverse, {
  --   prompts = "Notifications:", -- TODO: not working
  --   fzf_opts = {
  --     ["--delimiter"] = ":",
  --     ["--preview-window"] = "nohidden,down,60%,border-top,+{3}+3/3,~3",
  --   },
  --   debug = true,
  --
  --   -- actions = {
  --   --   ["default"] = function(e)
  --   --     vim.cmd.cd(e[1])
  --   --     vim.cmd(":enew") -- open an empty buffer
  --   --   end,
  --   --   ["ctrl-d"] = function(x)
  --   --     local choice = vim.fn.confirm("Delete '" .. #x .. "' projects? ", "&Yes\n&No", 2)
  --   --     if choice == 1 then
  --   --       local history = require("project_nvim.utils.history")
  --   --       for _, v in ipairs(x) do
  --   --         history.delete_project(v)
  --   --       end
  --   --     end
  --   --   end,
  --   -- },
  -- })
end

local M = {
  find_notifications = find_notifications,
}

return M
