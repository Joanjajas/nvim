local map = vim.keymap.set
local g = vim.g

-- set leader key
g.mapleader = " "

-- save current buffer
map("n", "<leader>s", "<cmd>update<CR>")

-- run last command
map("n", "<leader>:", "<cmd>execute @:<CR>")

-- move between quickfix list items
map("n", "<leader>n", "<cmd>cnext<CR>")
map("n", "<leader>p", "<cmd>cprev<CR>")

-- replace word under cursor in whole file
map("n", "<leader>rn", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")

-- move visual selections
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

-- exit visual mode
map("x", "v", "<Esc>")

-- copy to system clipboard
map({ "n", "x" }, "<leader>y", '"+y')
map({ "n", "x" }, "<leader>Y", 'V"+y')
map({ "n", "x" }, "<M-y>", '"+y')

-- exit insert mode
map({ "i", "s" }, "kj", "<Esc>")
map("c", "kj", "<C-c>")
map("t", "kj", "<C-\\><C-n>")

-- close current window
map("n", "<BS>", "<cmd>silent! q!<CR>")

-- jump half page up/down
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- jump to next search result
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- open terminal in new tab
map("n", "<leader>tm", "<cmd>tabe | setlocal norelativenumber | term<CR>")

-- don't copy the replaced text after pasting in visual mode
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>')

-- toggle nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")

-- toggle undotree
map("n", "<leader>ut", "<cmd>UndotreeToggle<CR>")

-- stop search highlighting
map("n", "<Esc>", "<cmd>noh<CR>")

-- allow moving the cursor through wrapped lines
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

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
map("i", "<C-n>", "copilot#Accept()", { expr = true, replace_keycodes = false, silent = true })

-- telescope
map("n", "<leader>ttl", "<cmd>Telescope<CR>")
map("n", "<leader>tfa", "<cmd>Telescope find_files no_ignore=true hidden=true<CR>")
map("n", "<leader>tff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>tfr", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader>tbf", "<cmd>Telescope buffers<CR>")
map("n", "<leader>trg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>tth", "<cmd>Telescope colorscheme<CR>")
map("n", "<leader>tgs", "<cmd>Telescope git_status<CR>")
map("n", "<leader>tgc", "<cmd>Telescope git_commits<CR>")
map("n", "<leader>tcm", "<cmd>Telescope commands<CR>")
map("n", "<leader>tch", "<cmd>Telescope command_history<CR>")
map("n", "<leader>tgb", "<cmd>Telescope git_branches<CR>")
map("n", "<leader>thg", "<cmd>Telescope highlights<CR>")
map("n", "<leader>thl", "<cmd>Telescope help_tags<CR>")
map("n", "<leader>tkm", "<cmd>Telescope keymaps<CR>")
map("n", "<leader>ttc", "<cmd>TodoTelescope<CR>")
map("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<CR>")

-- gitsigns
map("n", "<leader>gnh", "<cmd>Gitsigns next_hunk<CR>")
map("n", "<leader>gNh", "<cmd>Gitsigns prev_hunk<CR>")
map("n", "<leader>gph", "<cmd>Gitsigns preview_hunk<CR>")
map("n", "<leader>grb", "<cmd>Gitsigns reset_buffer<CR>")
map("n", "<leader>grh", "<cmd>Gitsigns reset_hunk<CR>")
map("n", "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>")
map("n", "<leader>gbl", "<cmd>Gitsigns blame_line<CR>")
map("n", "<leader>gvc", "<cmd>Gitsigns select_hunk<CR>")
map("n", "<leader>gsh", "<cmd>Gitsigns stage_hunk<CR>")
map("n", "<leader>gsb", "<cmd>Gitsigns stage_buffer<CR>")
map("n", "<leader>gpi", "<cmd>Gitsigns preview_hunk_inline<CR>")

-- harpoon
map("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end)
map("n", "<leader>hf", function()
  require("harpoon.ui").toggle_quick_menu()
end)
map("n", "<leader>hn", function()
  require("harpoon.ui").nav_next()
end)
map("n", "<leader>hp", function()
  require("harpoon.ui").nav_prev()
end)
map("n", "<leader>h1", function()
  require("harpoon.ui").nav_file(1)
end)
map("n", "<leader>h2", function()
  require("harpoon.ui").nav_file(2)
end)
map("n", "<leader>h3", function()
  require("harpoon.ui").nav_file(3)
end)
map("n", "<leader>h4", function()
  require("harpoon.ui").nav_file(4)
end)

-- lsp
map("n", "<leader>lgd", "<cmd>Telescope lsp_definitions<CR>")
map("n", "<leader>lgr", "<cmd>Telescope lsp_references<CR>")
map("n", "<leader>lds", "<cmd>Telescope lsp_document_symbols<CR>")
map("n", "<leader>lws", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
map("n", "<leader>ldg", "<cmd>Telescope diagnostics<CR>")

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
map("n", "<leader>cm", function()
  require("Comment.api").toggle.linewise.current()
end)

map("v", "<leader>cm", function()
  local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end)

-- leap
map("n", "<leader>l", "<Plug>(leap-forward-to)")
map("n", "<leader>L", "<Plug>(leap-backward-to)")
map("x", "<leader>l", "<Plug>(leap-forward-till)")
map("x", "<leader>L", "<Plug>(leap-backward-till)")
