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
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
]], true)

vim.api.nvim_exec([[
]], true)


vim.api.nvim_command(
  "autocmd BufWritePre *.ex,*.go,*.lua,*.rb,*.hs,*.py,*.ml,*.mli,*.c,*.h,*.cc,*.hh,*.cpp,*.hpp,*.m,*.php,*.odin,*.rs,*.ts,*.test.ts,*.tsx,*.test.tsx,*.js,*.test.js,*.jsx,*.test.jsx lua vim.lsp.buf.format()")

vim.cmd [[colorscheme bore]]


vim.api.nvim_set_option("clipboard", "unnamed")
vim.api.nvim_exec([[
set statusline=%!StatusLineNormal()

let g:currentmode={
  \ 'n': 'Normal',
  \ 'no': 'Normal·Operator Pending',
  \ 'v': 'Visual',
  \ 'V': 'Visual Line',
  \ '^V': 'Visual Block',
  \ 's': 'Select',
  \ 'S': 'S Line',
  \ '^S': 'S Block',
  \ 'i': 'Insert',
  \ 'R': 'Replace',
  \ 'Rv': 'V Replace',
  \ 'c': 'Command',
  \ 'cv': 'Vim Ex',
  \ 'ce': 'Ex',
  \ 'r': 'Prompt',
  \ 'rm': 'More',
  \ 'r?': 'Confirm',
  \ '!': 'Shell',
  \ 't': 'Terminal'
  \ }
let g:endoflines = {
  \ 'unix': 'lf',
  \ 'windows': 'crlf'
  \ }


function StatusLineNormal() abort
  let b:leftstatus = ''
  let b:rightstatus = ''

  hi SshGroup guibg=#fafafa guifg=#0d0d0d
  let b:leftstatus .= "%#SshGroup#   %#StatusLine#"
  let b:leftstatus .= '   '
  let b:leftstatus .= ' %{StatusErrors()} '
  let b:leftstatus .= ' %{StatusWarnings()}   '
  let b:leftstatus .= '-- %{toupper(g:currentmode[mode()])} --'
  let b:rightstatus .= 'File: %t   '
  let b:rightstatus .= 'Spaces: %{&shiftwidth}'
  let b:rightstatus .= '   %{empty(&fenc)?toupper(&fenc):toupper(&enc)}'
  let b:rightstatus .= '   %{toupper(g:endoflines[&ff])}'
  if !empty(&ft) && &ft != 'TelescopePrompt'
    let b:rightstatus .= '    %{&ft}'
  endif
  let b:rightstatus .= '   '
  return b:leftstatus . '%=' . b:rightstatus
endfunction
function StatusWarnings() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '0' | endif
  return info['warning']
endfunction
function StatusErrors() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '0' | endif
  return info['error']
endfunction

]], true)

require('gitsigns').setup()
-- require("presence").setup({
--  auto_update         = true,
--  editing_text        = "Editing %s",
--  file_explorer_text  = "Browsing %s",
--  git_commit_text     = "Committing changes",
--  plugin_manager_text = "Managing plugins",
--  reading_text        = "Reading %s",
--  workspace_text      = "Working on %s",
--  line_number_text    = "Line %s out of %s",
--  main_image          = "file",
--  buttons             = true,
-- })
