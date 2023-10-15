local map = vim.keymap.set

-- copy to system clipboard
map({ "n", "v" }, "<leader>y", '"+y')

-- save current buffer
map("n", "<leader>s", "<cmd>update<CR>")

-- exit insert mode
map({ "i", "c" }, "kj", "<Esc>")
map("t", "kj", "<C-\\><C-n>")

-- close current window
map("n", "<BS>", "<cmd>silent! q!<CR>")

-- open terminal in new tab
map("n", "<leader>tm", "<cmd>tabe | setlocal norelativenumber | term<CR>")

-- don't copy the replaced text after pasting in visual mode
map("v", "p", 'p:let @+=@0<CR>:let @"=@0<CR>')

-- toggle neotree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")

-- stop search highlighting
map("n", "<Esc>", "<cmd>noh<CR>")

-- allow moving the cursor through wrapped lines
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("v", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("v", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- navigate within insert mode
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")

-- move around splits using Ctrl + { h,j,k,l }
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- github copilot
map("i", "<C-n>", "copilot#Accept()", { expr = true, replace_keycodes = false })

-- telescope
map("n", "<leader>tfa", "<cmd>Telescope find_files no_ignore=true hidden=true<CR>")
map("n", "<leader>tff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>tfr", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader>tfg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>tfd", "<cmd>Telescope diagnostics<CR>")
map("n", "<leader>tth", "<cmd>Telescope colorscheme<CR>")
map("n", "<leader>tgs", "<cmd>Telescope git_status<CR>")
map("n", "<leader>tgc", "<cmd>Telescope git_commits<CR>")
map("n", "<leader>ttc", "<cmd>TodoTelescope<CR>")

-- gitsigns
map("n", "<leader>gnh", "<cmd>Gitsigns next_hunk<CR>")
map("n", "<leader>gNh", "<cmd>Gitsigns prev_hunk<CR>")
map("n", "<leader>gph", "<cmd>Gitsigns preview_hunk<CR>")
map("n", "<leader>grh", "<cmd>Gitsigns reset_hunk<CR>")
map("n", "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>")

-- lsp
map("n", "<leader>lgd", function()
  vim.lsp.buf.definition()
end)

map("n", "<leader>lgr", function()
  vim.lsp.buf.references()
end)

map("n", "<leader>lrn", function()
  vim.lsp.buf.rename()
end)

map("n", "<leader>lh", function()
  vim.lsp.buf.hover()
end)

map("n", "<leader>lca", function()
  vim.lsp.buf.code_action()
end)

map("n", "<leader>lf", function()
  vim.diagnostic.open_float()
end)

map("n", "<leader>lgn", function()
  vim.diagnostic.goto_next()
end)

map("n", "<leader>lgN", function()
  vim.diagnostic.goto_prev()
end)

-- comments
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end)

map("v", "<leader>/", function()
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end)
