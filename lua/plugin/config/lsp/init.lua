require("plugin.config.lsp.lspsaga")
require("plugin.config.lsp.signature")
require("plugin.config.lsp.servers")
require("neodev").setup()

vim.diagnostic.config({
  virtual_text = true,
  -- underline = false,
  float = { border = "rounded" },
})

-- diagnostics icons
local icons = { Error = "", Warn = "", Hint = "", Info = "" }

-- change diagnostic icons in the sign column
for type, icon in pairs(icons) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end
