-- TODO: need to test
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

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },
  opts = function(_, opts)
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local neogen = require("neogen")

    -- TODO: the appearance did not change
    table.insert(opts, {
      window = {
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        }),
      },
    })

    table.insert(opts.formatting, {
      format = function(entry, vim_item)
        vim_item = format(entry, vim_item)
        vim_item.abbr = vim_item.abbr:match("[^(]+") -- remove parameters from function abbr
        return vim_item
      end,
    })

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
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
    })
  end,
}
