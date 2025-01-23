return {
  {

    "nvim-telescope/telescope.nvim",
    enabled = false,
  },
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      { "<c-o>", "<cmd>FzfLua buffers<CR>" },
      { "<c-f>", "<cmd>FzfLua live_grep<CR>" },
      { "<c-p>", "<cmd>FzfLua files<CR>" },
      { "<c-x>", "<cmd>FzfLua oldfiles<CR>" },
      { "<leader>fh", "<cmd>FzfLua help_tags<CR>" },
      {
        "g.",
        function()
          require("fzf-lua").lsp_code_actions {
            winopts = {
              relative = "cursor",
              width = 0.6,
              height = 0.6,
              row = 1,
              preview = { vertical = "up:70%" },
            },
          }
        end,
        desc = "LSP code action",
        mode = { "n", "v" },
      },
    },
    opts = {
      files = {
        previewer = false,
        color_icons = false,
        path_shorten = true,
        multiprocess = true,
      },
      grep = {
        color_icons = false,
        path_shorten = true,
        multiprocess = true,
      },
      buffers = {
        color_icons = false,
        path_shorten = true,
      },
      lsp = {
        code_actions = {
          previewer = "codeaction_native",
          preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit'",
        },
      },
    },
  },
}
