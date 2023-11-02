local mason = require("mason")

local mason_config = {
  PATH = "skip",
}

local ensure_installed = {
  -- lsp servers
  "lua-language-server",
  "rust-analyzer",
  "pyright",
  "bash-language-server",

  -- formatters
  "stylua",
  "black",
  "shfmt",

  -- linters
  "shellcheck",
}

-- custom cmd to install all mason binaries in `ensure_installed`
vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
end, {})

mason.setup(mason_config)
