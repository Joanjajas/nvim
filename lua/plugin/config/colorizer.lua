local colorizer = require("colorizer")

-- attach colorizer to all buffers automatically
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    colorizer.attach_to_buffer(0)
  end,
})
