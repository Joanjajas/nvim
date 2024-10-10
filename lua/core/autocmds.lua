-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require("core.util").format_on_save()
  end,
})

-- remove auto comment on new line
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- set docker-compose.yml filetype so the lsp can work
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "docker-compose.yml" },
  callback = function()
    vim.bo.filetype = "yaml.docker-compose"
  end,
})

-- restore last knonw cursor position when opening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*" },
  callback = function()
    vim.cmd('silent! normal! g`"zv zz', false)
  end,
})

-- show nvimtree on startup only when opening a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.isdirectory(vim.fn.expand("%")) ~= 0 then
      require("nvim-tree.api").tree.open()
    end
  end,
})
