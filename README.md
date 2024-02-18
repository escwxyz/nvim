NOTE: this readme is outdated.

## Plugins (sort by alphabet)

## Keybindings

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
