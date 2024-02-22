local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("sixfourtwelve")

--
-- Formatter
local formatter_prettier = {
  function()
    return {
      -- exe = "prettier",
      -- args = {
      --   "--stdin-filepath",
      --   vim.api.nvim_buf_get_name(0)
      -- },
      -- stdin = true,
      exe = "prettierd",
      args = { vim.api.nvim_buf_get_name(0) },
      stdin = true
    }
  end
}

local formatter_ocamlformat = {
  function()
    return {
      exe = "ocamlformat",
      args = { vim.api.nvim_buf_get_name(0) },
      stdin = true
    }
  end
}

require('formatter').setup({
  logging = true,
  filetype = {
    javascript = formatter_prettier,
    javascriptreact = formatter_prettier,
    typescript = formatter_prettier,
    typescriptreact = formatter_prettier,
    json = formatter_prettier,
    graphql = formatter_prettier,
    ocamlformat = formatter_ocamlformat,
  }
})


vim.api.nvim_exec([[
augroup FormatAutogroup
autocmd!
autocmd BufWritePost *.astro,*.json,*.graphql,*.ml,*.mli,*.c,*.h,*.lua,*.rb,*.hs,*.py FormatWrite
augroup END
]], true)

vim.api.nvim_exec([[
let g:colorizer_auto_color = 1
set clipboard=unnamedplus
]], true)

vim.api.nvim_command("autocmd BufWritePre *.test.tsx,*.test.ts,*.ts,*.tsx,*.mjs,*.js,*.jsx,*.json EslintFixAll")
vim.api.nvim_command("autocmd BufWritePre *.ex,*.go,*.lua,*.rb,*.hs,*.py,*.ml,*.mli, lua vim.lsp.buf.format()")

require('wlsample.airline')
require('gitsigns').setup()
--require("presence").setup({
--  auto_update         = true,
--  editing_text        = "Editing %s",
--  file_explorer_text  = "Browsing %s",
--  git_commit_text     = "Committing changes",
--  plugin_manager_text = "Managing plugins",
--  reading_text        = "Reading %s",
--  workspace_text      = "Working on %s",
--  line_number_text    = "Line %s out of %s",
--  main_image          = "file",
--  buttons             = false,
-- })
