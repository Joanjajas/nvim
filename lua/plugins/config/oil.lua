local oil = require("oil")

local config = {
  default_file_explorer = false,
  use_default_keymaps = false,

  view_options = {
    show_hidden = true,
  },

  keymaps = {
    ["<CR>"] = "actions.select",
    ["<C-v>"] = "actions.select_vsplit",
    ["<C-x>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<C-p>"] = "actions.preview",
    ["<C-r>"] = "actions.refresh",
    ["-"] = "actions.parent",
  },
}

oil.setup(config)
