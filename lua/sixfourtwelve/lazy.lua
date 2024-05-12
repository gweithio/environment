vim.g.mapleader = " "

return require("lazy").setup({
  { 'datsfilipe/vesper.nvim' },
  { "nvim-treesitter/nvim-treesitter", build = ':TSUpdate', lazy = false },
  { "nvim-treesitter/playground" },
  { 'nvim-lualine/lualine.nvim' },
  { "tpope/vim-fugitive" },
  { "chrisbra/Colorizer" },
  { 'craftzdog/solarized-osaka.nvim' },
  -- Git stuff
  { "lewis6991/gitsigns.nvim" },
  { "f-person/git-blame.nvim" },

  -- UI
  { 'MunifTanjim/nui.nvim' },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "startup".setup()
    end
  },

  { 'windwp/nvim-autopairs' },
  {
    'VonHeikemen/lsp-zero.nvim',
    lazy = false,
    branch = 'v1.x',
    dependencies = {
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
  },
  { 'mhartington/formatter.nvim' },
  { 'kyazdani42/nvim-tree.lua',               dependencies = 'kyazdani42/nvim-web-devicons' },
  { 'nvim-telescope/telescope.nvim',          dependencies = { { 'nvim-lua/plenary.nvim' } } },
  { 'ggandor/lightspeed.nvim' },
  { "mbbill/undotree" },
  { "nvim-treesitter/nvim-treesitter-context" },
}, opts)
