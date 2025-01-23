-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

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
    "                            ",
    "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
    "   ▄▀███▄     ▄██ █████▀    ",
    "   ██▄▀███▄   ███           ",
    "   ███  ▀███▄ ███           ",
    "   ███    ▀██ ███           ",
    "   ███      ▀ ███           ",
    "   ▀██ █████▄▀█▀▄██████▄    ",
    "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
    "                            ",
    "     Powered By  eovim    ",
    "                            ",
  },

  buttons = {
    { txt = "  Find File", keys = "c-p", cmd = "FzfLua files" },
    { txt = "󰈭  Find Word", keys = "c-f", cmd = "FzfLua live_grep" },
    { txt = "  Recent Files", keys = "c-x", cmd = "FzfLua oldfiles" },
    { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

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
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
