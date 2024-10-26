local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = "rounded" }
  ),
  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "rounded" }
  ),
}

require("lspconfig").dartls.setup({
  cmd = { "dart", "language-server", "--protocol=lsp" },
  handlers = handlers,
  capabilities = capabilities,

  on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
    client.server_capabilities.documentHighlightProvider = nil
  end,
})

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
    handlers = handlers,
    capabilities = capabilities,

    on_attach = function(client, _)
      client.server_capabilities.semanticTokensProvider = nil
      client.server_capabilities.documentHighlightProvider = nil
    end,
  })
end
