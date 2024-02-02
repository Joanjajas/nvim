local gitsigns = require("gitsigns")

local config = {
  numhl = true,
  signcolumn = false,

  signs = {
    delete = { text = "-" },

    topdelete = { text = "-" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
}

gitsigns.setup(config)
