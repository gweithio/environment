return require('packer').startup(function()
  use { "wbthomason/packer.nvim" }
  use { "folke/tokyonight.nvim" }
  use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }
  use { "nvim-treesitter/playground" }
  use { "tpope/vim-fugitive" }
  use { "dmmulroy/tsc.nvim" }
  use { "lewis6991/gitsigns.nvim" }
  use { "f-person/git-blame.nvim" }
  use { 'reasonml-editor/vim-reason-plus' }
  use { 'danielo515/nvim-treesitter-reason' }
  use { 'windwp/nvim-autopairs' }
  use { 'nkrkv/nvim-treesitter-rescript' }
  use { 'rescript-lang/vim-rescript' }

  use { 'scalameta/nvim-metals', requires = { 'nvim-lua/plenary.nvim' } }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use { 'mhartington/formatter.nvim' }
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'windwp/windline.nvim' }
  use { 'ggandor/lightspeed.nvim' }
  use { "zbirenbaum/copilot.lua" }
  use { "mbbill/undotree" }
  use { "nvim-treesitter/nvim-treesitter-context" }
end)
