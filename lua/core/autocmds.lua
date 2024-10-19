-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require("core.util").format_on_save()
  end,
})

-- auto compile latex and reload pdf on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = function()
    if vim.fn.filereadable("main.tex") == 1 then
      vim.fn.jobstart("pdflatex main.tex", {
        on_exit = function(_, return_val)
          if return_val == 0 then
            print("Compilation successful!")
            vim.fn.system("open -g main.pdf")
            vim.fn.system([[
              osascript -e 'tell application "Preview" to activate' \
              -e 'tell application "iTerm" to activate'
            ]])
          else
            print("Compilation failed with error code: " .. return_val)
          end
        end,
        stdout_buffered = true,
        stderr_buffered = true,
      })
    else
      print("main.tex not found!")
    end
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
