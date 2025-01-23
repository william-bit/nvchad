return {
  { "hrsh7th/nvim-cmp", enabled = false },
  { "f3fora/cmp-spell", enabled = false },
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  { "hrsh7th/cmp-buffer", enabled = false },
  { "hrsh7th/cmp-path", enabled = false },
  {
    "saghen/blink.cmp",
    version = "*",
    event = { "InsertEnter", "cmdlineenter" },
    dependencies = "rafamadriz/friendly-snippets",
    -- use a release tag to download pre-built binaries
    opts = {
      keymap = {
        preset = "default",
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-j>"] = { "show", "show_documentation", "hide_documentation" },
        ["<Enter>"] = { "select_and_accept", "fallback" },
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        cmdline = {
          preset = "default",
          ["<Enter>"] = { "select_and_accept", "fallback" },
          ["<Tab>"] = { "show", "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
        },
      },
      completion = {
        ghost_text = { enabled = true },
        menu = {
          auto_show = function(ctx)
            if ctx.mode == "cmdline" then
              return false
            end
            if vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype()) then
              return false
            end
            return true
          end,
          draw = {
            columns = { { "kind_icon", gap = 10 }, { "label", "label_description" }, { "kind" } },
          },
        },
      },
      appearance = {
        kind_icons = {

          Array = " ",
          Boolean = "󰨙 ",
          Class = " ",
          Codeium = "󰘦 ",
          Color = " ",
          Control = " ",
          Collapsed = " ",
          Constant = "󰏿 ",
          Constructor = " ",
          Copilot = " ",
          Enum = " ",
          EnumMember = " ",
          Event = " ",
          Field = " ",
          File = " ",
          Folder = " ",
          Function = "󰊕 ",
          Interface = " ",
          Key = "⧪ ",
          Keyword = " ",
          Method = "󰊕 ",
          Module = " ",
          Namespace = "󰦮 ",
          Null = "␤ ",
          Number = "󰎠 ",
          Object = " ",
          Operator = " ",
          Package = " ",
          Property = " ",
          Reference = " ",
          Snippet = "▢ ",
          String = " ",
          Struct = "󰆼 ",
          Supermaven = " ",
          TabNine = "󰏚 ",
          Text = "Ͳ ",
          TypeParameter = " ",
          Unit = " ",
          Value = "❖ ",
          Variable = "󰀫 ",
        },
      },
    },
  },
}
