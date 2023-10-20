local textobjects = require("nvim-treesitter.configs")

local config = {
  textobjects = {
    select = {
      enable = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["icn"] = "@conditional.inner",
        ["acn"] = "@conditional.outer",
        ["icm"] = "@comment.inner",
        ["acm"] = "@comment.outer",
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outer",
        ["icl"] = "@call.inner",
        ["acl"] = "@call.outer",
        ["ics"] = "@class.inner",
        ["acs"] = "@class.outer",
        ["ia"] = "@assignment.inner",
        ["aa"] = "@assignment.outer",
      },
    },
  },
}

textobjects.setup(config)
