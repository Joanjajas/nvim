local null_ls = require("null-ls")
local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

local ruff_formatter = h.make_builtin({
  name = "ruff",
  method = FORMATTING,
  filetypes = { "python" },
  generator_opts = {
    command = "ruff",
    args = { "format", "-" },
    to_stdin = true,
  },
  factory = h.formatter_factory,
})

local config = {
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.diagnostics.mypy,
    ruff_formatter,
  },
}

null_ls.setup(config)
