local treesitter = require("nvim-treesitter.configs")

local config = {
  ensure_installed = {
    "python",
    "lua",
    "rust",
    "c",
    "vim",
    "vimdoc",
    "bash",
  },

  highlight = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,

      keymaps = {
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outer",
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
        ["ap"] = "@parameter.outer",
        ["ip"] = "@parameter.inner",
        ["aa"] = "@assignment.outer",
        ["ia"] = "@assignment.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        ["icl"] = "@call.inner",
        ["acl"] = "@call.outer",
        ["ics"] = "@class.inner",
        ["acs"] = "@class.outer",
        ["icm"] = "@comment.inner",
        ["acm"] = "@comment.outer",
      },
    },
  },
}

treesitter.setup(config)
