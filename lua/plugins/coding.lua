return {
  -- better escape
  --
  {
    "max397574/better-escape.nvim",
    event = "ModeChanged",
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "jj" },
        keys = function()
          return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<esc>l" or "<esc>"
        end,
      })
    end,
  },

  -- luasnip
  --
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        enabled = false,
      },
    },
    build = (not jit.os:find("Windows"))
        and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
      or nil,
    config = function()
      require("luasnip").config.set_config({
        history = false,
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
        -- Event on which to check for exiting a snippet's region
        region_check_events = "InsertEnter",
        delete_check_events = "InsertLeave",
        -- delete_check_events = "TextChanged",
      })
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = vim.fn.stdpath("config") .. "/snippets",
      })
    end,
  },
  -- cmp
  --
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local neogen = require("neogen")

      local has_words_before = function()
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
        local icons = require("config.icons").kinds

        if icons[vim_item.kind] then
          vim_item.kind = icons[vim_item.kind] .. vim_item.kind
        end
        return vim_item
      end

      return {
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          }),
        },
        format = function(entry, vim_item)
          vim_item = format(entry, vim_item)
          vim_item.abbr = vim_item.abbr:match("[^(]+") -- remove parameters from function abbr
          return vim_item
        end,

        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif neogen.jumpable() then
              neogen.jump_next()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            elseif neogen.jumpable(-1) then
              neogen.jump_prev()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
      }
    end,
  },

  -- minipairs
  --
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup({
        -- In which modes mappings from this `config` should be created
        modes = { insert = true, command = false, terminal = false },
        -- Global mappings. Each right hand side should be a pair information, a
        -- table with at least these fields (see more in |MiniPairs.map|):
        -- - <action> - one of 'open', 'close', 'closeopen'.
        -- - <pair> - two character string for pair to be used.
        -- By default pair is not inserted after `\`, quotes are not recognized by
        -- `<CR>`, `'` does not insert pair after a letter.
        -- Only parts of tables can be tweaked (others will use these defaults).
        mappings = {
          ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
          ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
          ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

          [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
          ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
          ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

          ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
          ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
          ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
          ["|"] = {
            action = "closeopen",
            pair = "||",
            neigh_pattern = "[^\\].",
            register = { cr = false },
          },
        },
      })
    end,
  },
  -- neogen
  --
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>nf",
        "<cmd>Neogen func<CR>",
        desc = "[Neogen] Function",
      },
      {
        "<leader>nc",
        "<cmd>Neogen class<CR>",
        desc = "[Neogen] Class",
      },
      {
        "<leader>nt",
        "<cmd>Neogen type<CR>",
        desc = "[Neogen] Type",
      },
    },
    config = function()
      require("neogen").setup({
        snippet_engine = "luasnip",
      })
    end,
  },
  -- refactoring
  --
  {
    "ThePrimeagen/refactoring.nvim",
    ft = { "typescript", "javascript", "lua" },
    config = function()
      require("refactoring").setup({
        prompt_func_return_type = {
          typescript = true,
          javascript = true,
        },
        prompt_func_param_type = {
          typescript = true,
          javascript = true,
        },
      })
      require("telescope").load_extension("refactoring")
      vim.keymap.set("v", "<leader>r", require("telescope").extensions.refactoring.refactors, { desc = "Refactoring" })
    end,
  },

  -- dial
  --
  -- TODO: decrement not working!!!
  {
    "monaqa/dial.nvim",
    keys = {
      {
        "<c-]>",
        function()
          require("dial.map").manipulate("increment", "normal")
        end,
        desc = "Increment",
      },
      {
        "<c-[>",
        function()
          require("dial.map").manipulate("decrement", "normal")
        end,
        desc = "Decrement",
      },
      {
        "<c-]>",
        mode = "v",
        function()
          require("dial.map").manipulate("increment", "visual")
        end,
        desc = "Increment",
      },
      {
        "<c-[>",
        mode = "v",
        function()
          require("dial.map").manipulate("decrement", "visual")
        end,
        desc = "Decrement",
      },
    },

    -- TODO: check https://github.com/monaqa/dial.nvim/blob/master/doc/dial.txt#L200 to add more groups
    -- config = function()
    --   local augend = require("dial.augend")
    --   require("dial.config").augends:register_group({
    --     -- default augends used when no group name is specified
    --     default = {
    --       augend.integer.alias.decimal, -- nonnegative decimal number
    --       augend.integer.alias.hex, -- nonnegative hex number
    --       -- date (2022/02/19, etc.)
    --       augend.date.new({
    --         pattern = "%Y/%m/%d",
    --         default_kind = "day",
    --       }),
    --     },
    --   })
    -- end,
  },
  -- copilot
  --
  -- { import = "lazyvim.plugins.extras.coding.copilot" },
}
