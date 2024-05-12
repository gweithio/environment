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
    ocamlformat = formatter_ocamlformat,
  }
})


vim.api.nvim_exec([[
set clipboard=unnamedplus
]], true)

vim.api.nvim_command("autocmd BufWritePre *.ex,*.go,*.lua,*.rb,*.hs,*.py,*.ml,*.mli, lua vim.lsp.buf.format()")

vim.cmd [[colorscheme vesper]]

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
