local telescope = require("lazyvim.util").telescope

return {
  -- zen mode
  --
  {
    "folke/zen-mode.nvim",
    keys = { { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle ZenMode" } },
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
          width = 119, -- width of the Zen window
          height = 0, -- height of the Zen window
          options = {
            cursorline = false,
            cursorcolumn = false,
            -- signcolumn = "no", -- disable signcolumn
            -- foldcolumn = "0", -- disable fold column
          },
        },
        plugins = {
          options = {
            enabled = true,
            ruler = false, -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
          },
          -- TODO: not working
          gitsigns = { enabled = false }, -- disables git signs
        },
        on_open = function(_)
          vim.g.ZenMode = true
        end,
        on_close = function()
          vim.g.ZenMode = false
        end,
      })
    end,
  },

  -- Oil file manager
  --
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = { { "<leader>o", "<cmd>Oil --float<CR>", desc = "Oil file manager" } },
    opts = {
      columns = {
        "icon",
        { "mtime", highlight = "Comment", format = "%T %y-%m-%d" },
      },
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 3,
        win_options = {
          winblend = 0,
        },
      },
    },
  },

  -- neotree
  --
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- cmd = "Neotree",
    -- keys = {
    --   {
    --     "<leader>fe",
    --     function()
    --       require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
    --     end,
    --     desc = "Explorer NeoTree (root dir)",
    --   },
    --   {
    --     "<leader>fE",
    --     function()
    --       require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
    --     end,
    --     desc = "Explorer NeoTree (cwd)",
    --   },
    --   { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    --   { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    -- },
    -- deactivate = function()
    --   vim.cmd([[Neotree close]])
    -- end,
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
  -- telescope
  --
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  -- TODO: Change
  keys = {
    { "<leader>?", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    { "<leader>.", "<cmd>Telescope commands<cr>", desc = "Commands" },
    --   { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
    --   { "<leader>/", telescope("live_grep"), desc = "Grep (root dir)" },
    --   { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    --   { "<leader><space>", telescope("files"), desc = "Find Files (root dir)" },
    --   -- find
    --   { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    --   { "<leader>ff", telescope("files"), desc = "Find Files (root dir)" },
    --   { "<leader>fF", telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    --   { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    --   -- git
    --   { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
    --   { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
    --   -- search
    --   { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    --   { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    --   { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    --   { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
    --   { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
    --   { "<leader>sg", telescope("live_grep"), desc = "Grep (root dir)" },
    --   { "<leader>sG", telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    --   { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    --   { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    --   { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    --   { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    --   { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    --   { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
    --   { "<leader>sw", telescope("grep_string"), desc = "Word (root dir)" },
    --   { "<leader>sW", telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
    --   {
    --     "<leader>ss",
    --     telescope("lsp_document_symbols", {
    --       symbols = {
    --         "Class",
    --         "Function",
    --         "Method",
    --         "Constructor",
    --         "Interface",
    --         "Module",
    --         "Struct",
    --         "Trait",
    --         "Field",
    --         "Property",
    --       },
    --     }),
    --     desc = "Goto Symbol",
    --   },
    --   {
    --     "<leader>sS",
    --     telescope("lsp_dynamic_workspace_symbols", {
    --       symbols = {
    --         "Class",
    --         "Function",
    --         "Method",
    --         "Constructor",
    --         "Interface",
    --         "Module",
    --         "Struct",
    --         "Trait",
    --         "Field",
    --         "Property",
    --       },
    --     }),
    --     desc = "Goto Symbol (Workspace)",
    --   },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<a-i>"] = function()
            telescope("find_files", { no_ignore = true })()
          end,
          ["<a-h>"] = function()
            telescope("find_files", { hidden = true })()
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
      },
    },
  },
  -- leap
  --
  {
    "ggandor/leap.nvim",
    dependencies = {
      { "tpope/vim-repeat" },
    },
    keys = false,
    event = "VeryLazy",
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "S", function()
        require("leap").leap({
          target_windows = vim.tbl_filter(function(win)
            return vim.api.nvim_win_get_config(win).focusable
          end, vim.api.nvim_tabpage_list_wins(0)),
        })
      end, { desc = "[Leap] Window" })

      vim.keymap.set({ "n", "x", "o" }, "s", function()
        require("leap").leap({ target_windows = { vim.fn.win_getid() } })
      end, { desc = "[Leap] Buffer" })
    end,
  },
  -- which key
  --
  {
    "folke/which-key.nvim",
    opts = {
      plugins = {
        marks = false,
        spelling = false,
      },
      defaults = {
        mode = { "n" },
        ["<leader>t"] = { name = "+terminal" },
        ["<leader>n"] = { name = "+neogen" },
      },
    },
  },
  -- gitsigns
  --
  {
    "lewis6991/gitsigns.nvim",
    -- TODO: use my icons
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
  },
  -- neoclip
  --
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      "kkharji/sqlite.lua",
    },
    cmd = "Telescope neoclip",
    keys = {
      { "<leader>y", "<cmd>Telescope neoclip<CR>", desc = "Neoclip (Yank History)" },
    },
    config = function()
      require("neoclip").setup({})
      require("telescope").load_extension("neoclip")
    end,
  },
  -- harpoon
  --
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon.mark").add_file()
          vim.notify("Mark added")
        end,
        desc = "[Harpoon] Add mark",
      },
      {
        "<leader>m",
        "<cmd>Telescope harpoon marks<CR>",
        desc = "[Harpoon] Marks",
      },
      {
        "<leader>]",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "[Harpoon] Next mark",
      },
      {
        "<leader>[",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "[Harpoon] Prev mark",
      },
    },
    config = function()
      require("harpoon").setup({})

      require("telescope").load_extension("harpoon")
    end,
  },
  -- toggleterm
  --
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = {
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Toggle horizontal terminal" },
      { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>", desc = "Toggle vertical terminal" },
    },
    config = {
      shade_terminals = true,
    },
  },
  -- bqf
  --
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = true,
  },
  -- url view
  --
  {
    "axieax/urlview.nvim",

    -- keys = {
    --   {
    --     "<leader>l",
    --     function()
    --       require("hydras.urlview_hydra").activate()
    --     end,
    --     desc = "[Hydra] UrlView",
    --   },
    -- },
    opts = {
      default_picker = "telescope",
    },
  },
  -- ufo
  --
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
        desc = "[UFO] Open all folds",
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
        desc = "[UFO] Close all folds",
      },
      {

        "zp",
        function()
          require("ufo").goNextClosedFold()
          require("ufo").peekFoldedLinesUnderCursor()
        end,
        desc = "[UFO] Next fold",
      },
      {

        "zP",
        function()
          require("ufo").goPreviousClosedFold()
          require("ufo").peekFoldedLinesUnderCursor()
        end,
        desc = "[UFO] Prev fold",
      },
    },
    opts = {
      provider_selector = function(_, _, _)
        return { "treesitter", "indent" }
      end,
      open_fold_hl_timeout = 150,
      close_fold_kinds = { "imports", "comment" },
      preivew = {
        win_config = {
          border = { "", "─", "", "", "", "─", "", "" },
          winhighlight = "Normal:Folded",
          winblend = 0,
        },
      },
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ("  %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end,
    },
  },
  -- project
  --
  {
    "ahmedkhalf/project.nvim",
    event = false, -- PERF: intended for faster load time
    keys = false,
    cmd = "Telescope projects",
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("telescope").load_extension("projects")
      vim.keymap.set("n", "<leader>p", "<cmd>Telescope projects<CR>", { desc = "Projects" })
    end,
  },
  --
  --
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = function()
      local icons = require("lazyvim.config").icons
      require("symbols-outline").setup({
        symbols = {
          File = { icon = icons.kinds.File, hl = "TSURI" },
          Module = { icon = icons.kinds.Module, hl = "TSNamespace" },
          Namespace = { icon = icons.kinds.Namespace, hl = "TSNamespace" },
          Package = { icon = icons.kinds.Package, hl = "TSNamespace" },
          Class = { icon = icons.kinds.Class, hl = "TSType" },
          Method = { icon = icons.kinds.Method, hl = "TSMethod" },
          Property = { icon = icons.kinds.Property, hl = "TSMethod" },
          Field = { icon = icons.kinds.Field, hl = "TSField" },
          Constructor = { icon = icons.kinds.Constructor, hl = "TSConstructor" },
          Enum = { icon = icons.kinds.Enum, hl = "TSType" },
          Interface = { icon = icons.kinds.Interface, hl = "TSType" },
          Function = { icon = icons.kinds.Function, hl = "TSFunction" },
          Variable = { icon = icons.kinds.Variable, hl = "TSConstant" },
          Constant = { icon = icons.kinds.Constant, hl = "TSConstant" },
          String = { icon = icons.kinds.String, hl = "TSString" },
          Number = { icon = icons.kinds.Number, hl = "TSNumber" },
          Boolean = { icon = icons.kinds.Boolean, hl = "TSBoolean" },
          Array = { icon = icons.kinds.Array, hl = "TSConstant" },
          Object = { icon = icons.kinds.Object, hl = "TSType" },
          Key = { icon = icons.kinds.Key, hl = "TSType" },
          Null = { icon = icons.kinds.Null, hl = "TSType" },
          EnumMember = { icon = icons.kinds.EnumMember, hl = "TSField" },
          Struct = { icon = icons.kinds.Struct, hl = "TSType" },
          Event = { icon = icons.kinds.Event, hl = "TSType" },
          Operator = { icon = icons.kinds.Operator, hl = "TSOperator" },
          TypeParameter = { icon = icons.kinds.TypeParameter, hl = "TSParameter" },
        },
      })
    end,
  },
}
