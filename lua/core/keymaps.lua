local map = vim.keymap.set

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
map("n", "<leader>rn", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")

-- stop search highlighting
map("n", "<Esc>", "<cmd>noh<CR>")

-- close current window
map("n", "<BS>", "<cmd>silent! q!<CR>")

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

map("i", "<M-n>", "<Plug>(copilot-accept-line)")
map("i", "<M-p>", "<cmd>Copilot<CR>")

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
map_plugin(telescope, "<leader>/", "current_buffer_fuzzy_find")
map_plugin(
  telescope,
  "<space>a",
  "find_files",
  { no_ignore = true, hidden = true }
)

map("n", "<leader>tc", function()
  require("telescope")
  vim.cmd("TodoTelescope")
end)

--------------------------------------------------------------------------------
-- gitsigns
--------------------------------------------------------------------------------
local gitsigns = require("gitsigns")

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

map("n", "<leader>gts", function()
  gitsigns.toggle_signs()
  gitsigns.toggle_numhl()
end)

--------------------------------------------------------------------------------
-- harpoon
--------------------------------------------------------------------------------
local harpoon = require("harpoon")

map("n", "<leader>hf", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

map("n", "<leader>ha", function()
  harpoon:list():append()
end)

map("n", "<M-j>", function()
  harpoon:list():next()
end)

map("n", "<M-k>", function()
  harpoon:list():prev()
end)

map("n", "<leader>h1", function()
  harpoon:list():select(1)
end)
map("n", "<leader>h2", function()
  harpoon:list():select(2)
end)
map("n", "<leader>h3", function()
  harpoon:list():select(3)
end)
map("n", "<leader>h4", function()
  harpoon:list():select(4)
end)

--------------------------------------------------------------------------------
-- lsp
--------------------------------------------------------------------------------
local telescope = "telescope.builtin"

map_plugin(telescope, "gd", "lsp_definitions")
map_plugin(telescope, "gr", "lsp_references")
map_plugin(telescope, "<leader>ds", "lsp_document_symbols")
map_plugin(telescope, "<leader>ws", "lsp_dynamic_workspace_symbols")
map_plugin(telescope, "<leader>dg", "diagnostics")

map("n", "<leader>lrn", function()
  vim.lsp.buf.rename()
end)

map("n", "K", function()
  vim.lsp.buf.hover()
end)

map("n", "<leader>lca", function()
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
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)

--------------------------------------------------------------------------------
-- oil
--------------------------------------------------------------------------------
map("n", "<leader>o", function()
  local oil = require("oil")
  local current_dir = oil.get_current_dir()
  vim.api.nvim_command("50vs")
  oil.open(current_dir)
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
