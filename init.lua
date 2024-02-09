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
autocmd BufWritePost *.astro,*.test.tsx,*.test.ts,*.ts,*.tsx,*.mjs,*.js,*.jsx,*.json,*.graphql,*.ml,*.mli,*.c,*.h,*.lua FormatWrite
augroup END
]], true)

vim.api.nvim_exec([[
let g:colorizer_auto_color = 1
set clipboard=unnamedplus
]], true)

vim.api.nvim_command("autocmd BufWritePre *.test.tsx,*.test.ts,*.ts,*.tsx,*.mjs,*.js,*.jsx,*.json EslintFixAll")
vim.api.nvim_command("autocmd BufWritePre *.ex,*.go lua vim.lsp.buf.format()")

require('wlsample.airline')
require('gitsigns').setup()
