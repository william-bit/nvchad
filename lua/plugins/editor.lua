return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },
  {
    "vim-scripts/ReplaceWithRegister",
    keys = {
      { "gl", "<Plug>ReplaceWithRegisterOperator" },
      { "glr", "<Plug>ReplaceWithRegisterLine" },
    },
  },
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
