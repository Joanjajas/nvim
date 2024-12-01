local signature = require("lsp_signature")

local config = {
  hint_enable = false,
  doc_lines = 0,
  handler_opts = {
    border = "none",
  },
}

signature.setup(config)
