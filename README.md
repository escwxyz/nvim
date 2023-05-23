neovim config based on [LazyVim](https://www.lazyvim.org/)

## Plugins (sort by alphabet)

- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - Use buffer as cmp source
- [cmp-path](https://github.com/hrsh7th/cmp-path) - Use filesystem paths as cmp source
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - Use LSP as cmp source
- [dressing.nvim](https://github.com/stevearc/dressing.nvim) - Improve default neovim UI
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git status signs
- [heirline.nvim](https://github.com/rebelot/heirline.nvim) - For building statusline, winbar and tabline
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [leap.nvim](https://github.com/ggandor/leap.nvim) - In vision cursor navigation
- [Luasnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine
- [mason.nvim](https://github.com/williamboman/mason.nvim) - Manage LSP & DAP servers, format tools etc.
- [mini.bufremove](https://github.com/echasnovski/mini.bufremove) - Persist window layout after removing buffer
- [mini.comment](https://github.com/echasnovski/mini.comment) - Comment
- [neogen](https://github.com/danymat/neogen) - Annotation
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) - Tree file explorer
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Formatting & Code actions, etc.
- [nvim-base16](https://github.com/rrethy/nvim-base16) - Colorschemes
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - For configuring LSP clients
- [nvim-neoclip](https://github.com/AckslD/nvim-neoclip.lua) - Yank history
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter for syntex highlighting and more
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Autotag for tsx etc.
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Icons
- [oil.nvim](https://github.com/stevearc/oil.nvim) - File explorer
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Utils for many plugins
- [project.nvim](https://github.com/ahmedkhalf/project.nvim) - Project management
- [sqlite](https://github.com/kkharji/sqlite.lua) - Database for other plugins
- [telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [toggleterm](https://github.com/akinsho/toggleterm.nvim) - terminal
- [ts-node-action](https://github.com/ckolkey/ts-node-action) - Node actions based on treesitter
- [urlview.nvim](https://github.com/axieax/urlview.nvim) - Open / copy urls from plugin manager, or within buffer
- [vim-wakatime](https://github.com/wakatime/vim-wakatime) - wakatime integretion
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Keymaps utility
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) - Distraction-free UI for writing

## Keybindings

<!-- - `/` Search inside current buffer via fzf-lua -->
<!-- - `<BS>` Format current buffer -->
<!-- - `<Tab>` Choose buffers via fzf-lua -->

- `gt` Jump to the top of the buffer
- `gb` Jump to the bottom of the buffer
- `gh` Jump backward to the head of the line
- `gl` Jump forward to the last of the line
- `gj` Jump down to the visible bottom of the window
- `gk` Jump up to the visible top of the window
- `gp` Go to preview

- `s` Vision scoped jump within current buffer via Leap
- `S` Vision scoped jump across windows via Leap

- `<leader>a` Add harpoon mark
- `<leader>c` Code Actions - LSP, node actions, etc
- `<leader>e` Tree file explorer
<!-- - `<leader>f` Find files via fzf-lua -->
- `<leader>gg` Lazygit
- `<leader>i`
- `<leader>j` Split window down
- `<leader>k` Split window up
- `<leader>l` Split window right
- `<leader>m` Harpoon marks
- `<leader>n` Annotations
- `<leader>o` Oil file / folder manipulation
- `<leader>p` Switching projects
- `<leader>q` Quit current buffer
- `<leader>r` Refactor selected code /
- `<leader>s` Live grep search
- `<leader>th` Toggle terminal horizontally
- `<leader>tv` Toggle terminal vertically
- `<leader>u` Urls
- `<leader>y` Yank history
- `<leader>z` Toggle Zen Mode
- `<leader>?` Help tags via fzf-lua
- `<leader>/` Find keymaps via fzf-lua
- `<leader>\` Lazy plugins
- `<leader>.` Commands
- `<leader><CR>` New lines below without entering insert mode
- `<leader><BS>` New lines above without entering insert mode

- `<C-a>` Select all
- `<C-t>` Toggle terminal
- `<C-w>` Save current buffer

## Snippets

- all
- dart
- rust
- typescript

## TODOs

- [x] properly set events for different plugins, see `:help events`
- [ ] write commonly used snippets for `rust`, `flutter / dart` and `typescript/tsx/react`
- [ ] config vscode like indent
- [ ] graphql / rest client for neovim
- [ ] unify shared icons for different plugins
- [ ] unify builtin ui with dressing.nvim
- [x] fully remove noice
<!-- - [x] use fzf-lua to replace telescope -->
- [ ] Batch rename
- [ ] Add dial.nvim
- [ ] Reduce startup time (currently between 50 - 100 ms, on M1 Max)
