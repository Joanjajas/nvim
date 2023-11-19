local map = vim.keymap.set

local function map_plugin(plugin, keys, command, args)
  map("n", "<leader>" .. keys, function()
    require(plugin)[command](args)
  end)
end

-- set leader key
vim.g.mapleader = " "

--------------------------------------------------------------------------------
-- insert mode
--------------------------------------------------------------------------------

-- exit insert mode
map({ "i", "s" }, "kj", "<Esc>")

--------------------------------------------------------------------------------
-- normal mode
--------------------------------------------------------------------------------

-- save current buffer
map("n", "<leader>s", "<cmd>update<CR>")

-- replace word under cursor in whole file
map("n", "<leader>rn", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")

-- stop search highlighting
map("n", "<Esc>", "<cmd>noh<CR>")

-- close current window
map("n", "<BS>", "<cmd>silent! q!<CR>")

-- toggle colorcolumn
map("n", "<leader>cc", function()
  if vim.wo.colorcolumn == "0" then
    vim.wo.colorcolumn = "81"
  else
    vim.wo.colorcolumn = "0"
  end
end)

--------------------------------------------------------------------------------
-- visual mode
--------------------------------------------------------------------------------

-- exit visual mode
map("x", "v", "<Esc>")

-- don't copy the replaced text after pasting in visual mode
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>')

--------------------------------------------------------------------------------
-- terminal mode
--------------------------------------------------------------------------------

-- open terminal in new tab
map("n", "<leader>tm", "<cmd>tabe | setlocal norelativenumber | term<CR>")

-- exit terminal mode
map("t", "kj", "<C-\\><C-n>")

--------------------------------------------------------------------------------
-- command mode
--------------------------------------------------------------------------------

-- run last command
map("n", "<leader>:", "<cmd>execute @:<CR>")

-- exit command mode
map("c", "kj", "<C-c>")

--------------------------------------------------------------------------------
-- motion
--------------------------------------------------------------------------------

-- jump to next search result
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- move around splits using Ctrl + { h,j,k,l }
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- navigate within insert mode
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")

-- jump half page up/down
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- move visual selections
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

-- move between quickfix list items
map("n", "<leader>n", "<cmd>cnext<CR>")
map("n", "<leader>p", "<cmd>cprev<CR>")

-- allow moving the cursor through wrapped lines
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

--------------------------------------------------------------------------------
-- copy
--------------------------------------------------------------------------------

-- copy to system clipboard
map({ "n", "x" }, "<leader>y", '"+y')
map({ "n", "x" }, "<leader>Y", 'V"+y')
map({ "n", "x" }, "<M-y>", '"+y')

--------------------------------------------------------------------------------
-- copilot
--------------------------------------------------------------------------------
map(
  "i",
  "<C-n>",
  "copilot#Accept()",
  { expr = true, replace_keycodes = false, silent = true }
)

--------------------------------------------------------------------------------
-- nvimtree
--------------------------------------------------------------------------------
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")

--------------------------------------------------------------------------------
-- undotree
--------------------------------------------------------------------------------
map("n", "<leader>ut", "<cmd>UndotreeToggle<CR>")

--------------------------------------------------------------------------------
-- telescope
--------------------------------------------------------------------------------
local telescope = "telescope.builtin"

map_plugin(telescope, "ttl", "builtin")
map_plugin(telescope, "tff", "find_files")
map_plugin(telescope, "tfr", "oldfiles")
map_plugin(telescope, "tbf", "buffers")
map_plugin(telescope, "trg", "live_grep")
map_plugin(telescope, "tth", "colorscheme")
map_plugin(telescope, "tgs", "git_status")
map_plugin(telescope, "tgc", "git_commits")
map_plugin(telescope, "tcm", "commands")
map_plugin(telescope, "tch", "command_history")
map_plugin(telescope, "tgb", "git_branches")
map_plugin(telescope, "thg", "highlights")
map_plugin(telescope, "thl", "help_tags")
map_plugin(telescope, "tkm", "keymaps")
map_plugin(telescope, "/", "current_buffer_fuzzy_find")
map_plugin(telescope, "tfa", "find_files", { no_ignore = true, hidden = true })

map("n", "<leader>ttc", "<cmd>TodoTelescope<CR>")

--------------------------------------------------------------------------------
-- gitsigns
--------------------------------------------------------------------------------
map_plugin("gitsigns", "gnh", "next_hunk")
map_plugin("gitsigns", "gNh", "prev_hunk")
map_plugin("gitsigns", "gph", "preview_hunk")
map_plugin("gitsigns", "grb", "reset_buffer")
map_plugin("gitsigns", "grh", "reset_hunk")
map_plugin("gitsigns", "gtd", "toggle_deleted")
map_plugin("gitsigns", "gbl", "blame_line")
map_plugin("gitsigns", "gvc", "select_hunk")
map_plugin("gitsigns", "gsh", "stage_hunk")
map_plugin("gitsigns", "gsb", "stage_buffer")
map_plugin("gitsigns", "gpi", "preview_hunk_inline")

map("n", "<leader>gts", function()
  require("gitsigns").toggle_signs()
  require("gitsigns").toggle_numhl()
end)

--------------------------------------------------------------------------------
-- harpoon
--------------------------------------------------------------------------------
map_plugin("harpoon.mark", "ha", "add_file")
map_plugin("harpoon.ui", "hf", "toggle_quick_menu")
map_plugin("harpoon.ui", "hn", "nav_next")
map_plugin("harpoon.ui", "hp", "nav_prev")
map_plugin("harpoon.ui", "h1", "nav_file", 1)
map_plugin("harpoon.ui", "h2", "nav_file", 2)
map_plugin("harpoon.ui", "h3", "nav_file", 3)
map_plugin("harpoon.ui", "h4", "nav_file", 4)

--------------------------------------------------------------------------------
-- lsp
--------------------------------------------------------------------------------
local telescope = "telescope.builtin"

map_plugin(telescope, "lgd", "lsp_definitions")
map_plugin(telescope, "lgr", "lsp_references")
map_plugin(telescope, "lds", "lsp_document_symbols")
map_plugin(telescope, "lws", "lsp_dynamic_workspace_symbols")
map_plugin(telescope, "ldg", "diagnostics")

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

--------------------------------------------------------------------------------
-- comments
--------------------------------------------------------------------------------
map("n", "<leader>cm", function()
  require("Comment.api").toggle.linewise.current()
end)

map("v", "<leader>cm", function()
  local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end)

--------------------------------------------------------------------------------
-- leap
--------------------------------------------------------------------------------
map("n", "<leader>j", "<Plug>(leap-forward-to)")
map("n", "<leader>J", "<Plug>(leap-backward-to)")
map("x", "<leader>j", "<Plug>(leap-forward-till)")
map("x", "<leader>J", "<Plug>(leap-backward-till)")
