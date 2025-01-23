return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    opts = {
      shade_terminals = false,
      shade_filetypes = {},
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = "curved",
        -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
        winblend = 4,
        title_pos = "left",
      },
    },
  },
}
