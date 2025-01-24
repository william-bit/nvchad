return {
  { "HiPhish/rainbow-delimiters.nvim", event = "BufRead" },
  {
    "vim-scripts/ReplaceWithRegister",
    keys = {
      { "gl", "<Plug>ReplaceWithRegisterOperator" },
      { "gln", "<Plug>ReplaceWithRegisterLine" },
    },
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead *.ts,*.tsx" },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
    keys = {
      { "ys" },
      { "cs" },
      { "ds" },
    },
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<A-o>", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
  },
}
