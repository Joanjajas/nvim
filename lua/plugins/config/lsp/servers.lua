local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  "rust_analyzer",
  "texlab",
  "lua_ls",
  "ruff",
  "pyright",
  "bashls",
  "docker_compose_language_service",
  "dockerls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,

    on_attach = function(client, _)
      client.server_capabilities.semanticTokensProvider = nil
      client.server_capabilities.documentHighlightProvider = nil
    end,
  })
end
