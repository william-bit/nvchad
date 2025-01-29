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
      { "<c-t>", "<cmd>FzfLua git_status<CR>" },
      { "<c-x>", "<cmd>FzfLua oldfiles<CR>" },
      { "<leader>fh", "<cmd>FzfLua help_tags<CR>" },
      { "gD", "<cmd>FzfLua lsp_declarations<CR>", desc = "Go to declaration" },
      { "gd", "<cmd>FzfLua lsp_definitions<CR>", desc = "Go to definition" },
      { "gi", "<cmd>FzfLua lsp_implementations<CR>", desc = "Go to implementation" },
      { "<leader>D", "<cmd>FzfLua lsp_typedefs<CR>", desc = "Go to type definition" },
      { "gr", "<cmd>FzfLua lsp_references<CR>", desc = "Show references" },
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
      { "<leader>sh", vim.lsp.buf.signature_help, desc = "Show signature help" },
      { "<leader>wa", vim.lsp.buf.add_workspace_folder, desc = "Add workspace folder" },
      { "<leader>wr", vim.lsp.buf.remove_workspace_folder, desc = "Remove workspace folder" },
      {
        "<leader>wl",
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        desc = "List workspace folders",
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
      git = {
        files = {
          color_icons = false,
        },
        status = {
          color_icons = false,
        },
      },
      lsp = {
        color_icons = false,
        code_actions = {
          previewer = "codeaction_native",
          preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit'",
        },
      },
    },
  },
}
