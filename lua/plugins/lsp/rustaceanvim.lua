return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  dependencies = {
    {
      "saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      config = true,
    },
  },
  -- TODO: configs
  config = true,
}
