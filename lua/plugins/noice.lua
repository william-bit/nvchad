local banned_notification_messages = {
  "[coc.nvim]: UnhandledRejection: TypeError: Cannot destructure property 'start' of 'range' as it is undefined.",
  "UnhandledRejection: TypeError: Cannot destructure property 'start' of 'range' as it is undefined.",
  "[telescope.builtin.buffers]: No buffers found with the provided options",
  "No buffers found with the provided options",
  "No information available",
}

return { -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
          },
          signature = {
            enabled = false,
          },
        },
      }
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      {
        "rcarriga/nvim-notify",
        config = function()
          -- Change native notify to vim notify
          vim.notify = function(msg, ...)
            for _, banned_msg in ipairs(banned_notification_messages) do
              if string.find(msg, banned_msg) then
                return
              end
            end
            require "notify"(msg, ...)
          end
        end,
      },
    },
  },
}
