local map = vim.keymap.set
-- export on_attach & capabilities
local on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")
  map("n", ",", function()
    vim.lsp.buf.hover()
  end, opts "Show variable info")
  map("n", "?", function()
    vim.diagnostic.open_float()
  end, { desc = "Show Error info" })
  map("n", "gs", function()
    vim.lsp.buf.rename()
  end, { desc = "Rename LSP" })
end

return on_attach
