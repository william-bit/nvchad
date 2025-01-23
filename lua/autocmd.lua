-- Change to directory given as argument
vim.cmd "if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif"

-- set up powershell
vim.cmd [[
  let &shell = executable('pwsh') ? 'pwsh -NoLogo' : 'powershell -NoLogo'
  let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=
]]

-- Enable Twilight
vim.api.nvim_create_autocmd({ "BufRead" }, {
  callback = function()
    require("twilight.init").enable()
  end,
})

-- disable inlay hints
vim.lsp.inlay_hint.enable(false)
