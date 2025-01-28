-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local endcommand = {
  "h",
  "j",
  "k",
  "l",
  "H",
  "M",
  "L",
  "e",
  "q",
  "E",
  "w",
  "W",
  "b",
  "B",
  "%",
  "^",
  "*",
  "_",
  "G",
  "+",
  "=",
  ":",
  "_",
  "-",
  ";",
  ",",
  "gg",
  "gd",
  "gD",
  "dd",
  "yy",
  "aw",
  "iw",
  "aW",
  "iW",
  "as",
  "is",
  "ap",
  "ip",
  "a]",
  "a[",
  "i]",
  "i[",
  "a)",
  "a(",
  "ab",
  "i)",
  "i(",
  "ib",
  "a>",
  "a<",
  "i>",
  "i<",
  "at",
  "it",
  "a}",
  "a{",
  "aB",
  "i}",
  "i{",
  "iB",
  'a"',
  "a'",
  "a`",
  'i"',
  "i'",
  "i`",
}

local function contains(list, x)
  for _, v in ipairs(list) do
    if v == x then
      return true
    end
  end
  return false
end
local input_key = ""
local array_key = { "" }
vim.on_key(function(_, key)
  if key and #key > 0 then
    local mode = vim.api.nvim_get_mode()
    if mode.mode == "n" or mode.mode == "no" then
      local typed = vim.fn.keytrans(key)
      local last_typed = array_key[#array_key]
      local last_2typed = string.sub(input_key, -2)
      if
        input_key == "0"
        or input_key == "$"
        or string.match(typed, "<.+>")
        or string.match(last_typed, "<.+>")
        or string.match(last_2typed, "[f|F|t|T].")
        or string.match(last_2typed, "[a-zA-Z][0|$]")
        or contains(endcommand, last_typed)
        or contains(endcommand, last_2typed)
      then
        array_key = { "" }
      end
      table.insert(array_key, typed)
      input_key = table.concat(array_key)
    end
    vim.cmd [[ doautoall ]]
  end
end)

M.base46 = {
  theme = "gruvbox",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                                                                    ",
    "      ████ ██████           █████      ██                     ",
    "     ███████████             █████                             ",
    "     █████████ ███████████████████ ███   ███████████   ",
    "    █████████  ███    █████████████ █████ ██████████████   ",
    "   █████████ ██████████ █████████ █████ █████ ████ █████   ",
    " ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
    "██████  █████████████████████ ████ █████ █████ ████ ██████ ",
    "                            ",
    "     Themed By  NvChad    ",
    "                            ",
  },

  buttons = {
    { txt = "  Find File", keys = "C-p", cmd = "FzfLua files" },
    { txt = "󰈭  Find Word", keys = "C-f", cmd = "FzfLua live_grep" },
    { txt = "  Git Files", keys = "C-t", cmd = "FzfLua git_status" },
    { txt = "  Recent Files", keys = "C-x", cmd = "FzfLua oldfiles" },
    {
      txt = "  LazyGit",
      keys = "A-i",
      cmd = ":lua require('toggleterm.terminal').Terminal :new({ cmd = 'lazygit', hidden = true, display_name = 'LazyGit' }) :toggle(10, 'float')",
    },
    { txt = "󱥚  Themes", keys = "t", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "m", cmd = "NvCheatsheet" },
    { txt = "󰒲  Lazy", keys = "l", cmd = ":Lazy" },
    { txt = "  Quit", keys = "q", cmd = ":qa" },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}
M.mason = {
  cmd = true,
  pkgs = {
    "cspell",
    "delve",
    "gofumpt",
    "goimports",
    "gopls",
    "intelephense",
    "js-debug-adapter",
    "json-lsp",
    "lua-language-server",
    "php-cs-fixer",
    "prettierd",
    "prisma-language-server",
    "pyright",
    "ruff",
    "shellcheck",
    "shfmt",
    "sqlfluff",
    "stylua",
    "tailwindcss-language-server",
    "vtsls",
  },
}

M.ui = {
  tabufline = {
    enabled = false,
  },
  statusline = {
    theme = "minimal",
    separator_style = "default",
    order = { "mode", "file", "git", "%=", "%=", "diagnostics", "lsp", "macro", "feedkey", "cwd", "cursor" },
    modules = {
      macro = function()
        local reg = vim.fn.reg_recording()
        if reg == "" then
          return ""
        end -- not recording
        return "Recording @" .. reg .. " "
      end,
      feedkey = function()
        if input_key == "" then
          return ""
        end -- not recording
        return "[" .. input_key .. "] "
      end,
    },
  },
}

return M
