local keys = "abcdefghijklmnopqrstuvwxyz"

local current_keys = keys
local remapHopKeys = function(remap)
  if remap ~= current_keys then
    current_keys = remap
    require("hop").setup { keys = remap }
  end
end

return {
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = keys,
    },
    keys = {
      {
        "t",
        function()
          remapHopKeys(keys)
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
          remapHopKeys(keys)
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
          remapHopKeys(keys)
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            current_line_only = true,
          }
        end,
      },
      {
        "F",
        function()
          remapHopKeys(keys)
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            current_line_only = true,
          }
        end,
      },
      {
        "h",
        function()
          remapHopKeys "habcdefgijklmnopqrstuvwxyz"
          require("hop").hint_anywhere {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            current_line_only = true,
          }
        end,
      },
      {
        "l",
        function()
          remapHopKeys "labcdefghijkmnopqrstuvwxyz"
          require("hop").hint_anywhere {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            current_line_only = true,
          }
        end,
      },
      {
        "b",
        function()
          remapHopKeys "bacdefghijklmnopqrstuvwxyz"
          require("hop").hint_words {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            current_line_only = true,
          }
        end,
      },
      {
        "B",
        function()
          remapHopKeys "bacdefghijklmnopqrstuvwxyz"
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
          remapHopKeys "wabcdefghijklmnopqrstuvxyz"
          require("hop").hint_words {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            current_line_only = true,
          }
        end,
      },
      {
        "W",
        function()
          remapHopKeys "wabcdefghijklmnopqrstuvxyz"
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
