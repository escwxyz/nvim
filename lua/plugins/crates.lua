return {
  "saecki/crates.nvim",
  event = "BufReadPost Cargo.toml",
  config = function()
    require("crates").setup({
      null_ls = {
        enabled = true,
      },
    })
  end,
}
