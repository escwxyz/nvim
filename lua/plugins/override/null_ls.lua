return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = {
      nls.builtins.formatting.fish_indent,
      nls.builtins.diagnostics.fish,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.rustfmt.with({
        extra_args = { "--edition=2021" },
      }),
      nls.builtins.formatting.dart_format,
      nls.builtins.formatting.shfmt,
      nls.builtins.formatting.prettierd.with({
        extra_args = {
          "--no-semi",
          "--single-quote",
          "--jsx-single-quote",
          "--print-width 100",
        },
      }),
    }
  end,
}
