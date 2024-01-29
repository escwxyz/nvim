return {
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
        border = require("configs.constants").borders,
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
}
