local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
    "rust_analyzer",
    "texlab",
    "ruff",
    "pyright",
    "bashls",
    "docker_compose_language_service",
    "ts_ls",
    "dockerls",
}

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        capabilities = capabilities,

        on_attach = function(client, _)
            client.server_capabilities.semanticTokensProvider = nil
            client.server_capabilities.documentHighlightProvider = nil
        end,
    })
end
