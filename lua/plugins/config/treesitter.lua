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
    "dockerfile",
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
        ["arm"] = "@parameter.outer",
        ["irm"] = "@parameter.inner",
      },
    },
  },
}

treesitter.setup(config)
