local null_ls = require("null-ls")

local builtin = null_ls.builtins

local config = {
  sources = {
    builtin.formatting.stylua,
    builtin.formatting.black,
    builtin.formatting.shfmt,
    builtin.diagnostics.shellcheck,
  },
}

null_ls.setup(config)
