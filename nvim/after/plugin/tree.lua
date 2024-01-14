require 'nvim-tree'.setup {
  filters = {
    custom = { ".git", "node_modules", ".vscode" }
  },
  git = {
    ignore = true
  },
  update_focused_file = {
    enable = true,
  },
  view = {
    adaptive_size = true,
    float = {
      enable = true
    }
  }
}
vim.keymap.set('n', '<C-n>', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>ff', vim.cmd.NvimTreeFindFile)
