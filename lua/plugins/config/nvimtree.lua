local nvimtree = require("nvim-tree")
local api = require("nvim-tree.api")

local config = {
  hijack_cursor = true,

  update_focused_file = {
    enable = true,
  },

  git = {
    ignore = false,
  },

  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = false,
  },

  renderer = {
    root_folder_label = false,

    icons = {
      git_placement = "after",
      glyphs = {
        git = {
          unstaged = "!",
          untracked = "?",
          deleted = "x",
          staged = "+",
          ignored = "",
          unmerged = "",
          renamed = "",
        },
      },

      show = {
        folder_arrow = false,
      },
    },
  },

  view = {
    adaptive_size = true,
    cursorline = false,
    side = "right",

    width = {
      max = 40,
    },
  },

  on_attach = function(bufnr)
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "<BS>", ":q!<CR>", { buffer = bufnr })
    vim.keymap.set("n", "+", api.tree.change_root_to_node, { buffer = bufnr })
  end,
}

nvimtree.setup(config)
