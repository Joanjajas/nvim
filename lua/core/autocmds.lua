vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
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

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "docker-compose.yml" },
    callback = function()
        vim.bo.filetype = "yaml.docker-compose"
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = { "*" },
    callback = function()
        vim.cmd('silent! normal! g`"zv zz', false)
    end,
})
