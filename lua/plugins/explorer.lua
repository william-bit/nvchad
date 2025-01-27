return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<A-b>", require("nvim-tree.api").tree.toggle, desc = "toggle nvim-tree" },
    },
    opts = {
      filters = { dotfiles = false },
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        width = 40,
        preserve_window_proportions = true,
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 100,
      },
      renderer = {
        root_folder_label = false,
        highlight_git = true,
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            default = "󰈚",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
            },
            git = { unmerged = "" },
          },
        },
      },
    },
  },
}
