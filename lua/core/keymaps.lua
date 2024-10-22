local map = vim.keymap.set
local telescope = "telescope.builtin"

local function map_plugin(plugin, keys, command, args)
  map("n", keys, function()
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
map("n", "<leader>Rn", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")

-- stop search highlighting
map("n", "<Esc>", "<cmd>noh<CR>")

-- close current window
map("n", "<BS>", "<cmd>silent! q!<CR>")

-- redo
map("n", "U", "<cmd>redo<CR>")

-- toggle colorcolumn
map("n", "<leader>cc", function()
  if vim.wo.colorcolumn == "81" then
    vim.wo.colorcolumn = "0"
  else
    vim.wo.colorcolumn = "81"
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

-- copy selection to system clipboard
map({ "n", "x" }, "<leader>y", '"+y')
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
map("n", "<leader>n", "<cmd>NvimTreeToggle<CR>")

--------------------------------------------------------------------------------
-- undotree
--------------------------------------------------------------------------------
map("n", "<leader>ut", "<cmd>UndotreeToggle<CR>")

--------------------------------------------------------------------------------
-- telescope
--------------------------------------------------------------------------------
map_plugin(telescope, "<leader>tl", "builtin")
map_plugin(telescope, "<leader>f", "find_files")
map_plugin(telescope, "<leader>rg", "live_grep")
map_plugin(telescope, "<leader>th", "colorscheme")
map_plugin(telescope, "<leader>gs", "git_status")
map_plugin(telescope, "<leader>gc", "git_commits")
map_plugin(telescope, "<leader>cm", "commands")
map_plugin(telescope, "<leader>ch", "command_history")
map_plugin(telescope, "<leader>gb", "git_branches")
map_plugin(telescope, "<leader>hg", "highlights")
map_plugin(telescope, "<leader>hl", "help_tags")
map_plugin(telescope, "<leader>km", "keymaps")

map_plugin(
  telescope,
  "<space>a",
  "find_files",
  { no_ignore = true, hidden = true }
)

map("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find({
    sorting_strategy = "ascending",
  })
end)

map("n", "<leader>tc", function()
  require("telescope")
  vim.cmd("TodoTelescope")
end)

--------------------------------------------------------------------------------
-- gitsigns
--------------------------------------------------------------------------------

map_plugin("gitsigns", "gm", "next_hunk")
map_plugin("gitsigns", "gM", "prev_hunk")
map_plugin("gitsigns", "<leader>ph", "preview_hunk")
map_plugin("gitsigns", "<leader>rb", "reset_buffer")
map_plugin("gitsigns", "<leader>rh", "reset_hunk")
map_plugin("gitsigns", "<leader>td", "toggle_deleted")
map_plugin("gitsigns", "<leader>bl", "blame_line")
map_plugin("gitsigns", "<leader>vh", "select_hunk")
map_plugin("gitsigns", "<leader>gsh", "stage_hunk")
map_plugin("gitsigns", "<leader>gsb", "stage_buffer")
map_plugin("gitsigns", "<leader>pi", "preview_hunk_inline")

--------------------------------------------------------------------------------
-- harpoon
--------------------------------------------------------------------------------
local harpoon = require("harpoon")

map("n", "<leader>hf", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

map("n", "<leader>ha", function()
  harpoon:list():add()
end)

map("n", "<C-n>", function()
  harpoon:list():next()
end)

map("n", "<C-m>", function()
  harpoon:list():prev()
end)

--------------------------------------------------------------------------------
-- lsp
--------------------------------------------------------------------------------

map_plugin(telescope, "gd", "lsp_definitions")
map_plugin(telescope, "gr", "lsp_references")
map_plugin(telescope, "<leader>ds", "lsp_document_symbols")
map_plugin(telescope, "<leader>ws", "lsp_dynamic_workspace_symbols")
map_plugin(telescope, "<leader>dg", "diagnostics")

map("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end)

map("n", "K", function()
  vim.lsp.buf.hover()
end)

map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end)

map("n", "m", function()
  vim.diagnostic.open_float()
end)

map("n", "gn", function()
  vim.diagnostic.goto_next()
end)

map("n", "gN", function()
  vim.diagnostic.goto_prev()
end)

--------------------------------------------------------------------------------
-- treesitter
--------------------------------------------------------------------------------
local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

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
