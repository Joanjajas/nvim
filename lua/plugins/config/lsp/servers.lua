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

-- user installed servers
local servers = {
  "lua_ls",
  "rust_analyzer",
  "pyright",
  "bashls",
  "clangd",
  "tailwindcss",
  "tsserver",
}

lspconfig.matlab_ls.setup({
  settings = {
    MATLAB = {
      installPath = "/Applications/MATLAB_R2023b.app",
    },
  },
})

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    handlers = handlers,
    capabilities = capabilities,

    on_attach = function(client, _)
      client.server_capabilities.semanticTokensProvider = nil
    end,
  })
end
