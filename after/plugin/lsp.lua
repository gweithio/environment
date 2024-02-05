local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
  "vtsls",
  "gopls",
  "astro"
})

lsp.set_preferences({
  sign_icons = { error = " ", warn = " ", hint = " ", info = " " }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Insert }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-x>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
  ['<Tab>'] = cmp.mapping.select_next_item({ behaviour = cmp.SelectBehavior.Insert }),
  ['<S-Tab>'] = cmp.mapping.select_prev_item({ behaviour = cmp.SelectBehavior.Insert })
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 1 },
    { name = 'buffer',   keyword_length = 3 },
    { name = 'luasnip',  keyword_length = 2 },
  }
})


local opts = { buffer = bufnr, remap = false }
lsp.on_attach(function(client, bufnr)
  vim.keymap.set('n', 'gd', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', opts)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "bh", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "hh", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
 end)

lsp.configure("vtsls", {
  root_dir = require("lspconfig").util.root_pattern(".git", "pnpm-workspace.yaml", "pnpm-lock.yaml", "yarn.lock",
    "package-lock.json", "bun.lockb"),
  experimental = {
    completion = {
      entriesLimit = 3
    }
  }
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

require("tsc").setup()

require("copilot").setup({
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<C-l>"
    }
  }
})

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.keymap.set("i", "<C-j>", 'copilot#Accept()', { expr = true, silent = true })
