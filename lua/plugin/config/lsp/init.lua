-- global editor diagnostics config
vim.diagnostic.config({
  virtual_text = true,
  underline = false,
  float = { border = "rounded" },
})

-- diagnostics icons
local icons = { Error = "", Warn = "", Hint = "", Info = "" }

-- change diagnostic icons in the sign column
for type, icon in pairs(icons) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

-- improve neovim lsp experience
require("plugin.config.lsp.lspsaga")

-- signature help, docs and completion for the nvim lua API.
require("neodev").setup()

-- function signatures
require("plugin.config.lsp.signature")

-- lsp servers
require("plugin.config.lsp.servers")
