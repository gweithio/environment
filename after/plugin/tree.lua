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
    width = 25,
    adaptive_size = true,
    float = {
      quit_on_focus_loss = true,
      enable = false
    }
  }
}

vim.keymap.set('n', '<C-n>', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>ff', vim.cmd.NvimTreeFindFile)
