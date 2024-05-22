require('nvim-treesitter.configs').setup {
  ensure_installed = { "typescript", "c", "cpp", "javascript", "lua", "ocaml", "go", "dockerfile", "php", "perl", "json", "yaml", "toml", "html", "css", "bash", "tsx", "python", "rust", "haskell" },
  sync_install = false,
  auto_install = true,
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require('treesitter-context').setup {
  enable = true
}
