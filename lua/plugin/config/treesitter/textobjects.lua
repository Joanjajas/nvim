local textobjects = require("nvim-treesitter.configs")

local config = {
  textobjects = {
    select = {
      enable = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ii"] = "@conditional.inner",
        ["ai"] = "@conditional.outer",
        ["im"] = "@comment.inner",
        ["am"] = "@comment.outer",
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outer",
        ["ic"] = "@call.inner",
        ["ac"] = "@call.outer",
        ["ia"] = "@assignment.inner",
        ["aa"] = "@assignment.outer",
      },
    },
  },
}

textobjects.setup(config)
