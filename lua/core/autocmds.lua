-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require("core.util").format_on_save()
  end,
})

-- remove auto comment on new line
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     vim.opt.formatoptions:remove({ "c", "r", "o" })
--   end,
-- })
--

-- restore last knonw cursor position when opening a file
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

-- open nvimtree on startup when opening a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.isdirectory(vim.fn.expand("%")) ~= 0 then
      require("nvim-tree.api").tree.open()
    end
  end,
})
