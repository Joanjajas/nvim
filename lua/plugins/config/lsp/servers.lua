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
lspconfig.rust_analyzer.setup({
  handlers = handlers,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
    },
  },

  on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

lspconfig.matlab_ls.setup({
  handlers = handlers,
  capabilities = capabilities,
  settings = {
    MATLAB = {
      installPath = "/Applications/MATLAB_R2023b.app",
    },
  },

  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = nil
  end,
})

local servers = {
  "lua_ls",
  "pyright",
  "bashls",
  "clangd",
  "texlab",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    handlers = handlers,
    capabilities = capabilities,

    on_attach = function(client, _)
      client.server_capabilities.semanticTokensProvider = nil
    end,
  })
end
