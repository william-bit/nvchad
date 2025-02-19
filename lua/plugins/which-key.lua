return {
  {
    "folke/which-key.nvim",
    event = "BufRead",
    keys = {
      -- Which-key as fix spell check
      {
        "<c-l>",
        function()
          require("which-key").show("z=", { mode = "n", auto = true })
        end,
        desc = "Fix spell check",
        mode = { "n" },
      },
    },
  },
}
