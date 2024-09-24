return {
  { import = "lazyvim.plugins.extras.editor.dial" },
  { import = "lazyvim.plugins.extras.editor.inc-rename" },
  { import = "lazyvim.plugins.extras.editor.telescope" },
  { import = "lazyvim.plugins.extras.editor.illuminate" },
  { import = "lazyvim.plugins.extras.editor.harpoon2" },
  { import = "lazyvim.plugins.extras.editor.fzf" },
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        false,
      },
      {
        "<leader>/R",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    keys = {
      {
        "<leader>st",
        false,
      },
      {
        "<leader>sT",
        false,
      },
      {
        "<leader>/t",
        function()
          require("todo-comments.fzf").todo()
        end,
        desc = "Todo",
      },
      {
        "<leader>/T",
        function()
          require("todo-comments.fzf").todo({ keywords = { "TODO", "FIX", "FIXME" } })
        end,
        desc = "Todo/Fix/Fixme",
      },
    },
  },
  {
    "nvim-focus/focus.nvim",
    keys = {
      {
        "<C-w>h",
        "<cmd>FocusSplitLeft<CR>",
        desc = "[Focus] or create left window",
      },

      {
        "<C-w>j",
        "<cmd>FocusSplitDown<CR>",
        desc = "[Focus] or create bottom window",
      },
      {
        "<C-w>k",
        "<cmd>FocusSplitUp<CR>",
        desc = "[Focus] or create upper window",
      },
      {
        "<C-w>l",
        "<cmd>FocusSplitRight<CR>",
        desc = "[Focus] or create right window",
      },
      {
        "<C-w>=",
        "<cmd>FocusEqualise<CR>",
        desc = "Equalise all the splits",
      },
      {
        "<C-w>-",
        "<cmd>FocusSplitNicely<CR>",
        desc = "Split window nicely",
      },
    },
  },
  {
    "folke/which-key.nvim",
    -- TODO:
    keys = {
      {
        "<C-w><space>",
        false,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    opts = {
      event_handlers = {
        {
          event = "file_opened",
          handler = function(_)
            require("neo-tree").close_all()
          end,
        },
      },
    },
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>e",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>E",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      -- {
      --   -- NOTE: this requires a version of yazi that includes
      --   -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      --   "<c-up>",
      --   "<cmd>Yazi toggle<cr>",
      --   desc = "Resume the last yazi session",
      -- },
    },
    opts = {
      open_for_directories = true,
      floating_window_scaling_factor = 0.8,
      keymaps = {
        show_help = "?",
        open_file_in_vertical_split = "<c-v>",
        open_file_in_horizontal_split = "<c-x>",
        open_file_in_tab = "<c-t>",
        grep_in_directory = "<c-s>",
        replace_in_directory = "<c-g>",
        cycle_open_buffers = "<tab>",
        copy_relative_path_to_selected_files = "<c-y>",
        send_to_quickfix_list = "<c-q>",
      },
    },
  },
  {
    "coffebar/neovim-project",
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
    keys = {
      {
        "<leader>p",
        "<cmd>NeovimProjectDiscover<CR>",
        -- "<cmd>Telescope neovim-project discover<CR>",
        desc = "Projects",
      },
      {
        "<leader>P",
        "<cmd>NeovimProjectHistory<CR>",
        desc = "Load Project Session",
      },
    },
    opts = {
      projects = { -- define project roots
        "~/projects/*",
        "~/projects/dotfiles/nvim/",
        "~/projects/dotfiles/nvim/snippets/",
        "~/projects/raycast-extensions/*",
      },
      dashboard_mode = true,
      picker = {
        type = "telescope",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    -- TODO: keymaps
    keys = {
      { ":", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" },
      {
        "<leader>/",
        false,
      },
      {
        "<leader>:",
        false,
      },
      {
        "<leader><space>",
        false,
      },
      {
        "<leader>fb",
        false,
      },
      {
        "<leader>fc",
        false,
      },
      {
        "<leader>ff",
        false,
      },
      {
        "<leader>fF",
        false,
      },
      {
        "<leader>fg",
        false,
      },
      {
        "<leader>fr",
        false,
      },
      {
        "<leader>fR",
        false,
      },
      {
        "<leader>gc",
        false,
      },
      {
        "<leader>gs",
        false,
      },
      {
        "<leader>s",
        false,
      },
      {
        "<leader>sa",
        false,
      },
      {
        "<leader>sb",
        false,
      },
      {
        "<leader>sc",
        false,
      },
      {
        "<leader>sC",
        false,
      },
      {
        "<leader>sd",
        false,
      },
      {
        "<leader>sD",
        false,
      },
      {
        "<leader>sg",
        false,
      },
      {
        "<leader>sG",
        false,
      },
      {
        "<leader>sh",
        false,
      },
      {
        "<leader>sH",
        false,
      },
      {
        "<leader>sj",
        false,
      },
      {
        "<leader>sk",
        false,
      },
      {
        "<leader>sl",
        false,
      },
      {
        "<leader>sm",
        false,
      },
      {
        "<leader>sM",
        false,
      },
      {
        "<leader>so",
        false,
      },
      {
        "<leader>/o",
        "<cmd>Telescope vim_options<CR>",
        desc = "Options",
      },
      {
        "<leader>sR",
        false,
      },
      {
        "<leader>sq",
        false,
      },
      {
        "<leader>sw",
        false,
      },
      {
        "<leader>sW",
        false,
      },
      {
        "<leader>sw",
        mode = "v",
        false,
      },
      {
        "<leader>sW",
        mode = "v",
        false,
      },
      {
        "<leader>uC",
        false,
      },
      {
        "<leader>ss",
        false,
      },
      {
        "<leader>sS",
        false,
      },
    },
    opts = {
      -- TODO: set up
      extensions = {
        cmdline = {
          picker = {
            layout_config = {
              width = 120,
              height = 25,
            },
          },
          mappings = {
            complete = "<Tab>",
            run_selection = "<C-CR>",
            run_input = "<CR>",
          },
        },
      },
    },
  },
  {
    "jonarrien/telescope-cmdline.nvim",
    config = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("cmdline")
      end)
    end,
  },
  {

    "ibhagwan/fzf-lua",
    opts = {
      winopts = {
        preview = {
          default = "bat",
        },
      },
      previewers = {
        bat = {
          theme = "everforest",
        },
      },
    },
    keys = {
      {
        "<leader>/",
        false,
      },
      {
        "<leader>:",
        false,
      },
      {
        "<leader><space>",
        false,
      },
      {
        "<leader>fb",
        false,
      },
      {
        "<leader>fc",
        false,
      },
      {
        "<leader>ff",
        false,
      },
      {
        "<leader>fF",
        false,
      },
      {
        "<leader>fg",
        false,
      },
      {
        "<leader>fr",
        false,
      },
      {
        "<leader>fR",
        false,
      },
      {
        "<leader>gc",
        false,
      },
      {
        "<leader>gs",
        false,
      },
      {
        "<leader>s",
        false,
      },
      {
        "<leader>sa",
        false,
      },
      {
        "<leader>sb",
        false,
      },
      {
        "<leader>sc",
        false,
      },
      {
        "<leader>sC",
        false,
      },
      {
        "<leader>sd",
        false,
      },
      {
        "<leader>sD",
        false,
      },
      {
        "<leader>sg",
        false,
      },
      {
        "<leader>sG",
        false,
      },
      {
        "<leader>sh",
        false,
      },
      {
        "<leader>sH",
        false,
      },
      {
        "<leader>sj",
        false,
      },
      {
        "<leader>sk",
        false,
      },
      {
        "<leader>sl",
        false,
      },
      {
        "<leader>sm",
        false,
      },
      {
        "<leader>sM",
        false,
      },
      {
        "<leader>sR",
        false,
      },
      {
        "<leader>sq",
        false,
      },
      {
        "<leader>sw",
        false,
      },
      {
        "<leader>sW",
        false,
      },
      {
        "<leader>sw",
        mode = "v",
        false,
      },
      {
        "<leader>sW",
        mode = "v",
        false,
      },
      {
        "<leader>uC",
        false,
      },
      {
        "<leader>ss",
        false,
      },
      {
        "<leader>sS",
        false,
      },
      {
        "<leader>,",
        false,
      },
      --#region customized keymaps
      {
        "/",
        "<cmd>FzfLua blines<CR>",
        desc = "Search in buffer",
      },
      {
        "<leader>/g",
        LazyVim.pick("live_grep"),
        desc = "Grep root dir",
      },
      {
        "<leader>/f",
        LazyVim.pick("files"),
        desc = "Find files in root dir",
      },
      {
        "<leader>/F",
        LazyVim.pick("files", { root = false }),
        desc = "Find files (cwd)",
      },
      {
        "<leader>/h",
        "<cmd>FzfLua help_tags<CR>",
        desc = "Find help tags",
      },
      {
        "<leader>/H",
        "<cmd>FzfLua highlights<CR>",
        desc = "Search highlights",
      },
      {
        "<leader>/c",
        "<cmd>FzfLua commands<CR>",
        desc = "Search commands",
      },
      {
        "<leader>/C",
        "<cmd>FzfLua command_history<CR>",
        desc = "Search command history",
      },
      {
        "<leader>/r",
        "<cmd>FzfLua oldfiles<CR>",
        desc = "Search recent files",
      },
      {
        "<leader>/b",
        "<Cmd>FzfLua buffers sort_mru=true sort_lastused=true<CR>",
        desc = "Search buffers",
      },
      --#endregion
    },
  },
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
  },
  -- Lua
  {
    "folke/zen-mode.nvim",
    keys = { { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle ZenMode" } },
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          cursorline = false,
          cursorcolumn = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = true },
        gitsigns = {
          enabled = false,
        },
        -- this will change the font size on wezterm when in zen mode
        -- See alse also the Plugins/Wezterm section in this projects README
        wezterm = {
          enabled = true,
          -- can be either an absolute font size or the number of incremental steps
          font = "+4", -- (10% increase per step)
        },
        -- this will change the scale factor in Neovide when in zen mode
        -- See alse also the Plugins/Wezterm section in this projects README
        neovide = {
          enabled = true,
          -- Will multiply the current scale factor by this number
          scale = 1.2,
          -- disable the Neovide animations while in Zen mode
          disable_animations = {
            neovide_animation_length = 0,
            neovide_cursor_animate_command_line = false,
            neovide_scroll_animation_length = 0,
            neovide_position_animation_length = 0,
            neovide_cursor_animation_length = 0,
            neovide_cursor_vfx_mode = "",
          },
        },
      },
      on_open = function()
        vim.g.ZenMode = true
      end,
      on_close = function()
        vim.g.ZenMode = false
      end,
    },
  },
}
