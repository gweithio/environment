--local formatter_prettier =  {
--function()
-- return {
-- exe = "prettier",
-- args = {
--   "--stdin-filepath",
--   vim.api.nvim_buf_get_name(0)
-- },
-- stdin = true,
--      exe = "prettierd",
--      args = {vim.api.nvim_buf_get_name(0)},
--      stdin = true
--    }
--  end
--}

--require('formatter').setup({
--  logging = true,
--  filetype = {
--    javascript = formatter_prettier,
--    javascriptreact = formatter_prettier,
--    typescript = formatter_prettier,
--   typescriptreact = formatter_prettier,
--    json = formatter_prettier,
--    yaml = formatter_prettier,
--    astro = formatter_prettier,
--    graphql = formatter_prettier
--  }
--})


--vim.api.nvim_exec([[
--   augroup FormatAutogroup
--  autocmd!
--  autocmd BufWritePost *.astro,*.ts,*.tsx,*.mjs,*.js,*.jsx,*.json,*.graphql,*.ex,*.go,*.lua FormatWrite
--  augroup END
-- ]], true)

--vim.api.nvim_command(
--  "autocmd BufWritePre *.astro,*.ts,*.tsx,*.mjs,*.js,*.jsx,*.json,*.graphql,*.ex,*.go,*.lua lua vim.lsp.buf.format()")
