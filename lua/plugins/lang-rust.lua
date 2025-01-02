return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            procMacro = {
              enable = true,
              ignored = {
                -- NOTE:
                -- https://book.leptos.dev/getting_started/leptos_dx.html#2-editor-autocompletion-inside-component-and-server
                ["leptos_macro"] = { "server" },
              },
            },
          },
        },
      },
    },
  },
}
