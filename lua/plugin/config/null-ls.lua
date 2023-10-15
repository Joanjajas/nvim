local null_ls = require("null-ls")

local builtin = null_ls.builtins

local null_ls_config = {
  sources = {
    builtin.formatting.stylua,
    builtin.formatting.black,
  },
}

null_ls.setup(null_ls_config)
