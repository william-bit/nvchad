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

vim.keymap.set("t", "<c-u>", "<Up>")
vim.keymap.set("t", "<c-d>", "<Down>")
vim.cmd [[
    tnoremap <c-w> <c-@>
    tnoremap <A-[> <C-\><C-n>
]]
