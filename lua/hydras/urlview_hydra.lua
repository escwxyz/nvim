local M = {}

local Hydra = require("hydra")

local cmd = require("hydra.keymap-util").cmd

local hint = [[

⠀⠀⢸⣿⣿⣿⠛⣿⣿⠛⢻⣿⠛⠛⠛⢿⣿⠛⢻⣿⣿⣿⣿⡇⠀_b_: buffer⠀
⠀⠀⢸⣿⣿⣿⠀⣿⣿⠀⢸⣿⠀⠸⠆⢀⣿⠀⢸⣿⣿⣿⣿⡇⠀_p_: plugin⠀
⠀⠀⢸⣿⣿⣿⠀⠹⠿⠀⣸⣿⠀⢰⡀⠻⣿⠀⠸⠿⠿⣿⣿⡇⠀⠀
⠀⠀⢸⣿⣿⣿⣷⣶⣴⣶⣿⣿⣶⣾⣷⣶⣿⣶⣶⣶⣶⣿⣿⡇⠀_q_: quit⠀

]]
local urlview_hydra = Hydra({
  name = "URL",
  config = {
    -- hint = false, --NOTE set to false to show on statusline - switch back when fully fix the statusbar
    hint = {
      position = "middle",
      border = "rounded",
    },
  },
  hint = hint,
  heads = {
    { "b", cmd("UrlView"), { desc = "buffer links", exit = true } },
    { "p", cmd("UrlView lazy"), { desc = "plugin links", exit = true } },
    { "q", nil, { desc = "quit", exit = true } },
  },
})

function M.activate()
  urlview_hydra:activate()
end

return M
