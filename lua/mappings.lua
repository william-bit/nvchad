require "nvchad.mappings"

-- add yours here

local map = vim.keymap
map.set("n", "<c-k>", "<c-v>")
map.set("n", "<c-k>", "A_<Esc>r")
map.set("n", "<c-c>", "za")
map.set("n", "x", '"_x')
map.set("n", "X", '"_X')
map.set("n", "=", "<c-w>+")
map.set("n", "-", "<c-w>-")
map.set("n", "(", "<c-w><")
map.set("n", ")", "<c-w>>")
map.set("n", "<c-n>", "<c-v>")

map.set("n", "<A-n>", "<cmd>enew <CR>")

map.set("n", ",", function()
  vim.lsp.buf.hover()
end, { desc = "Show variable info" })
map.set("n", "?", function()
  vim.diagnostic.open_float()
end, { desc = "Show Error info" })
map.set("n", "gs", function()
  require "nvchad.lsp.renamer"()
end, { desc = "Rename LSP" })

-- Map Ctrl-Backspace to delete the previous word in insert mode.
vim.cmd [[
  imap <C-BS> <C-W>
  imap <C-h> <C-W>
]]

-- Handle link
function HandleLineURL()
  local line = vim.fn.getline "."
  local url = string.match(line, "[a-z]*://[^ >,;]*")
  if url then
    os.execute("start " .. url)
  else
    print "Not link found"
  end
end

function HandleCursorUrl()
  local keyword = vim.fn.expand "<cWORD>"
  local url = string.match(keyword, "[a-z]*://[^ >,;]*")
  if url then
    os.execute("start " .. url)
  else
    HandleLineURL()
  end
end

map.set("n", "<A-;>", "<cmd>lua HandleCursorUrl()<CR>", { desc = "Open Url in cursor line" })

-- Which-key as fix spell check
map.set("n", "<c-l>", function()
  require("which-key").show("z=", { mode = "n", auto = true })
end, { desc = "Fix spell check" })

-- Toggle term
vim.keymap.set({ "n", "t" }, "<C-j>", function()
  require("toggleterm").toggle()
end, { desc = "terminal toggleable vertical term" })

for i = 10, 1, -1 do
  vim.keymap.set({ "n", "t" }, "<A-" .. i .. ">", function()
    require("toggleterm").toggle(i, 10, "git_dir", "horizontal", "terminal" .. i)
  end, { desc = "terminal toggleable vertical term" })
end

map.set({ "n", "t" }, "<A-i>", function()
  require("toggleterm.terminal").Terminal
    :new({ cmd = "lazygit", hidden = true, display_name = "LazyGit" })
    :toggle(10, "float")
end, { desc = "Lazygit (Root Dir)" })

vim.keymap.set("t", "<c-u>", "<Up>")
vim.keymap.set("t", "<c-d>", "<Down>")
vim.cmd [[
    tnoremap <c-w> <c-@>
    tnoremap <A-[> <C-\><C-n>
]]
