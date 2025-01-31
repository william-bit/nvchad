return {
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = "abcdefghijklmnopqrstuvwxyz",
    },
    keys = {
      {
        "t",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            current_line_only = true,
            hint_offset = -1,
          }
        end,
      },
      {
        "T",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            current_line_only = true,
            hint_offset = 1,
          }
        end,
      },
      {
        "f",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            current_line_only = true,
          }
        end,
      },
      {
        "F",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            current_line_only = true,
          }
        end,
      },
      {
        "s",
        function()
          require("hop").hint_vertical()
        end,
      },
      {
        "S",
        function()
          require("hop").hint_lines()
        end,
      },
      {
        "b",
        function()
          require("hop").hint_words {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            current_line_only = true,
          }
        end,
      },
      {
        "B",
        function()
          require("hop").hint_words {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            hint_position = require("hop.hint").HintPosition.END,
            current_line_only = true,
          }
        end,
      },
      {
        "w",
        function()
          require("hop").hint_words {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            current_line_only = true,
          }
        end,
      },
      {
        "W",
        function()
          require("hop").hint_words {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            hint_position = require("hop.hint").HintPosition.END,
            current_line_only = true,
          }
        end,
      },
    },
  },
}
