return {
  "rcarriga/nvim-notify",
  {
    "vim-scripts/ReplaceWithRegister",
    event = "BufRead",
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
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "BufRead",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}
