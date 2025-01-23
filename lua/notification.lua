-- Change native notify to vim notify
local banned_messages = {
  "[coc.nvim]: UnhandledRejection: TypeError: Cannot destructure property 'start' of 'range' as it is undefined.",
  "UnhandledRejection: TypeError: Cannot destructure property 'start' of 'range' as it is undefined.",
  "[telescope.builtin.buffers]: No buffers found with the provided options",
  "No buffers found with the provided options",
  "No information available",
}
vim.notify = function(msg, ...)
  for _, banned_msg in ipairs(banned_messages) do
    if string.find(msg, banned_msg) then
      return
    end
  end
  require "notify"(msg, ...)
end
