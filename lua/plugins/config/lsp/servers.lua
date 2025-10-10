local servers = {
    "rust_analyzer",
    "texlab",
    "ruff",
    -- "pyright",
    "bashls",
    "docker_compose_language_service",
    "ts_ls",
    "dockerls",
    "ty",
    "lua_ls",
}

vim.lsp.config("*", {
    on_attach = function(client, _)
        client.server_capabilities.semanticTokensProvider = nil
        client.server_capabilities.documentHighlightProvider = nil
    end,
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

vim.lsp.config("ty", {
    settings = {
        ty = {
            experimental = {
                rename = true,
            },
        },
    },
})

for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end
